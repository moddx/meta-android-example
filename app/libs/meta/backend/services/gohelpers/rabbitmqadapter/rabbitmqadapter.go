package rabbitmqadapter

import (
	"github.com/streadway/amqp"

	"encoding/json"
	"fmt"
	"log"
	"os"
	"strconv"
)

type Config struct {
	Host string
	Port int

	Exchange          string
	Read_queue        string
	Read_routing_key  string
	Write_queue       string
	Write_routing_key string

	User     string
	Password string
}

var RabbitConf Config
var Connection *amqp.Connection
var chPublish *amqp.Channel

func logError(err error, msg string) {
	if err != nil {
		log.Printf("Error! %s: %s\n", msg, err)
	}
}

// callback for panicing and error and log reason if error occures
func failOnError(err error, msg string) {
	if err != nil {
		log.Println("Error! %s: %s", msg, err)
		panic(fmt.Sprintf("%s: %s", msg, err))
	}
}

func Connect(conf Config) {
	Connection = createConnection(conf)
}

func CreateChannel() (*amqp.Channel, error) {
	return createChannel(Connection)
}

// pulishes on the default write-channel
func Publish(exchange string, key string, body string) error {
	fmt.Printf("Publishing message with key: %s\n", key)

	err := chPublish.Publish(
		exchange, // exchange name
		key,      // routing key
		false,    // mandatory
		false,    // imediate
		amqp.Publishing{
			ContentType: "text/plain",
			Body:        []byte(body),
		})

	logError(err, "rabbitmqadapter::: Failed to publish a message")
	return err
}

func createConnection(conf Config) *amqp.Connection {
	port_as_string := strconv.Itoa(conf.Port)
	host := "amqp://" + conf.User + ":" + conf.Password + "@" + conf.Host + ":" + port_as_string + "/"

	conn, err := amqp.Dial(host)
	failOnError(err, "rabbitmqadapter::: Could not connect to RabbitMQ")

	return conn
}

// creates an channel bound to the given connection
// handles error when occures
func createChannel(conn *amqp.Connection) (*amqp.Channel, error) {
	ch, err := conn.Channel()
	logError(err, "rabbitmqadapter::: Failed to open a channel")

	return ch, err
}

func createExchange(ch *amqp.Channel, exchange string) error {
	fmt.Printf("Declaring exchange %s\n", exchange)
	err := ch.ExchangeDeclare(
		exchange, // name
		"topic",  // type
		false,    // durable
		false,    // auto-deleted
		false,    // internal
		false,    // noWait
		nil,      // arguments
	)
	logError(err, "rabbitmqadapter::: Failed to create exchange")
	return err
}

func createQueue(ch *amqp.Channel, queue string, key string, exchange string) error {
	_, err := ch.QueueDeclare(
		queue, // queue name
		false, // durable
		false, // delete when unused
		false, // exclusive
		false, // no wait
		nil)   // arguments
	if err != nil {
		logError(err, "rabbitmqadapter::: Failed to declare Queue")
		return err
	}

	err = ch.QueueBind(
		queue,
		key,
		exchange,
		false, // no wait
		nil,   // arguments
	)
	logError(err, "rabbitmqadapter::: Failed to bind Queue to exchange")
	return err
}

func LoadConf(path string) Config {
	// reading config file
	file, err := os.Open(path)
	if err != nil {
		log.Println("rabbitmqadapter:: could not load " + path + ": " + err.Error())
		recover()
	}

	// preparing JSON Decoder
	dec := json.NewDecoder(file)
	configuration := Config{}

	// decode JSON
	err = dec.Decode(&configuration)
	if err != nil {
		log.Println("datahandler:: could not decode " + path + ": " + err.Error())
		recover()
	}

	// return configuration struct
	return configuration
}

// Creates a constant connection and a channel for publishing via Publish()
func InitPublisher(conf Config) {
	RabbitConf = conf

	Connect(conf)
	ch, err := CreateChannel()
	failOnError(err, "rabbitmqadapter::: Initiation failed.")
	err = createExchange(ch, conf.Exchange)
	failOnError(err, "rabbitmqadapter::: Initiation failed.")

	chPublish = ch
}
