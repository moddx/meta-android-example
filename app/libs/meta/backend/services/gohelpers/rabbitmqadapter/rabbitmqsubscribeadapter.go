package rabbitmqadapter

import (
	"github.com/streadway/amqp"
	"log"
)

type RabbitDelivery <-chan amqp.Delivery
type callbackFunc func(RabbitDelivery, chan bool)

func subscribe(ch *amqp.Channel, queue string, callback callbackFunc) error {
	msg, err := ch.Consume(
		queue, // queue name
		"",    // consumer
		true,  // auto acknolage
		false, // exclusice
		false, // no local
		false, // no wait
		nil)   // arguments

	if err != nil {
		logError(err, "rabbitmqadapter::: Failed to register a consumer")
		return err
	}

	untilDone := make(chan bool)
	go callback(msg, untilDone)
	log.Printf("rabbitmqadapter::: [*] Waiting for messages. To exit press CTRL+C")

	<-untilDone // wait until done or until the goroutine finishes
	return nil
}

func SubscribeNew(queue string, routing_key string, exchange string, callback callbackFunc) error {
	ch, err := CreateChannel()
	defer ch.Close()
	if err != nil {
		return err
	}

	err = createQueue(ch, queue, routing_key, exchange)
	if err != nil {
		return err
	}

	msg, err := ch.Consume(
		queue, // queue name
		"",    // consumer
		true,  // auto acknowlage
		false, // exclusice
		false, // no local
		false, // no wait
		nil)   // arguments

	if err != nil {
		logError(err, "rabbitmqadapter::: Failed to register a consumer")
		return err
	}

	untilDone := make(chan bool)
	go callback(msg, untilDone)
	log.Printf("rabbitmqadapter::: [*] Waiting for messages. To exit press CTRL+C")

	<-untilDone // wait until done or until the goroutine finishes

	_, err = ch.QueueDelete(
		queue, // name
		false, // ifUnused
		true,  // ifEmpty
		false) // noWait bool

	return err
}
