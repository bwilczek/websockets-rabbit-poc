#!/bin/bash

docker run --rm --name rabbitmq-web-stomp -p 5672:5672 -p 15674:15674 rabbitmq-web-stomp
