package main

import (
	"./filehelper"
	"./gohelpers/rabbitmqadapter"
	"crypto/md5"
	"encoding/hex"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
)

var RabbitConf rabbitmqadapter.Config

func publishIr(hash string, irFile string) {
	// assemble json
	m := make(map[string]string)
	m["Id"] = hash
	m["Content"] = irFile

	jsonData, err := json.Marshal(m)
	if err != nil {
		log.Println("ir-file-handler:: could not create json " + err.Error())
		recover()
	}

	// publish
	log.Println("ir-file-handler:: publishing IR file with ID: " + hash)
	rabbitmqadapter.Publish(RabbitConf.Exchange, RabbitConf.Write_routing_key, string(jsonData))
}

// gets []byte and performs MD5 Hash (returns hash as string)
func createMD5(contents []byte) string {
	hash := md5.New()
	hash.Write(contents)
	sum := hash.Sum(nil)
	fmt.Println(hex.EncodeToString(sum))
	return hex.EncodeToString(sum)
}

// Handler Method for uploaded files
func fileuploadHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Println(r.Method)
	switch r.Method {

	case http.MethodPut:
		fmt.Println("PUT Called")
		contents, err := ioutil.ReadAll(r.Body)

		if err != nil {
			fmt.Fprintln(w, "400 -> "+err.Error())
			w.WriteHeader(http.StatusBadRequest)
			w.Write([]byte("400 - Bad Request! Could not read request body."))
			return
		}
		// create hash
		hash := createMD5(contents)

		// perform file saving and triggers action to perform
		// go filehelper.PerformFileAction(hash, contents)

		go publishIr(hash, string(contents))

		w.WriteHeader(http.StatusOK)
		w.Write([]byte(hash))

		break
	default:
		w.WriteHeader(http.StatusMethodNotAllowed)
		w.Write([]byte("405 - Method not allowed!"))
	}
}

func main() {
	RabbitConf = rabbitmqadapter.LoadConf("rabbitMQ_conf.json")
	rabbitmqadapter.InitPublisher(RabbitConf)

	path := filehelper.PrepareTempFolder()
	fmt.Println(path)
	// defer os.RemoveAll(path)

	http.HandleFunc("/upload", fileuploadHandler)
	err := http.ListenAndServe(":4200", nil)
	if err != nil {
		log.Fatal("Listen and serve: ", err.Error())
	}

}
