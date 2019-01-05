package main

import (
	"./gohelpers/rabbitmqadapter"
	"crypto/md5"
	"encoding/hex"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"strconv"
	"time"

	"github.com/xeipuuv/gojsonschema"
)

type JSONResponse struct {
	Id   string      `json:"id"`
	Data interface{} `json:"data"` // generic typish?
}

var RabbitConf rabbitmqadapter.Config

func publishAndSubscribe(client_id string, contents []byte, w http.ResponseWriter) {
	// decode json to get data
	jres := &JSONResponse{}
	err := json.Unmarshal([]byte(string(contents)), &jres)

	if err != nil {
		log.Println("datahandler:: Could not parse input as json " + err.Error())
		recover()
	}

	if jres.Id == "" {
		log.Println("datahandler:: Message is missing the apikey! Aborting.")
		return
	}

	log.Println("client_id is: " + client_id)

	write_key := jres.Id + "-work." + client_id
	read_key := jres.Id + "-result." + client_id
	read_queue := "meta.production." + jres.Id + "-result." + client_id

	// Publish work to MQ / ComputeUnit instances.
	rabbitmqadapter.Publish(RabbitConf.Exchange, write_key, string(contents))

	// Read results and send them back to the client.
	callback := func(delivery rabbitmqadapter.RabbitDelivery, finished chan bool) {
		for d := range delivery {
			log.Println("Result: " + string(d.Body))
			w.WriteHeader(http.StatusOK)
			w.Write(d.Body)
			finished <- true
		}
	}

	err = rabbitmqadapter.SubscribeNew(read_queue, read_key, RabbitConf.Exchange, callback)
	if err != nil {
		log.Println("Could not subscribe to result channel! Aborting.")
		w.WriteHeader(http.StatusPreconditionFailed)
		w.Write([]byte("412 - Precondition Failed. There doesn't seem to be a service with that id."))
		return
	}
}

// validates json and proves scheme for requests
func validateJSON(json string) (bool, error) {
	schema := "file://./util/request_schema.json"
	schemaLoader := gojsonschema.NewReferenceLoader(schema)
	contentLoader := gojsonschema.NewStringLoader(json)

	result, err := gojsonschema.Validate(schemaLoader, contentLoader)

	if err == nil && result.Valid() {
		return true, err
	} else {
		return false, err
	}
}

func handleRequest(w http.ResponseWriter, r *http.Request) {
	switch r.Method {

	case http.MethodPost:
		log.Println("POST Called")
		contents, err := ioutil.ReadAll(r.Body)

		if err != nil {
			fmt.Fprintln(w, "404 -> "+err.Error())
			recover()
		}

		log.Println("Contents: " + string(contents))

		if len(contents) == 0 {
			log.Println("Request body is empty! Dismissing Request.")
			w.WriteHeader(http.StatusBadRequest)
			w.Write([]byte("400 - Bad request. Request body is empty."))
			return
		}

		// validating json data + error handling
		valid, err := validateJSON(string(contents))
		if !valid || err != nil {
			fmt.Fprintln(w, "JSON send was not valid -> "+err.Error())
			w.WriteHeader(http.StatusBadRequest)
			w.Write([]byte("400 - Bad request. Request body is empty."))
			return
		}

		// generate id for client
		//hasher.Reset()
		addr := r.RemoteAddr
		now := strconv.FormatInt(time.Now().UnixNano(), 10)
		sum := md5.Sum([]byte(addr + now))
		client_id := hex.EncodeToString(sum[:])

		// send json to message-queue
		publishAndSubscribe(client_id, contents, w)

		break
	default:
		w.WriteHeader(http.StatusMethodNotAllowed)
		w.Write([]byte("405 - Method not allowed!"))
	}
}

func main() {
	RabbitConf = rabbitmqadapter.LoadConf("rabbitMQ_conf.json")
	rabbitmqadapter.InitPublisher(RabbitConf)

	http.HandleFunc("/", handleRequest)
	err := http.ListenAndServe(":4300", nil)
	if err != nil {
		log.Fatal("Listen and serve: ", err.Error())
	}

}
