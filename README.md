### Intro ###

This is a proof of concept for connectivity between the web browser and RabbitMQ.

The JavaScript part is basically copied from examples of this excellent library:
https://github.com/JSteunou/webstomp-client

The backend part is represented by a single ruby script.

### Running it ###

0. `docker` is a pre-requirement

1. Build the rabbitmq container with web stomp plugin
```
./build_rabbitmq.sh
```
2. Start the rabbitmq service
```
start_rabbitmq_fg.sh
```
3. Open `index.html` in the web browser
4. Send some chat messages to see that rabbit backend is operational
5. Install backend side software
```
bundle install
```
6. Send chat message using a ruby sript
```
bundle exec ruby send_message.rb "Backend message"
```
7. This message should appear in both chat windows in the browser

### Architecture ###

Whole communication is handled by the `rabbitmq` message bus. JavaScript client
(browser) connects to it using a WebSocket (thanks to `rabbitmq_web_stomp` plugin).
Ruby client uses `bunny` gem to speak with `rabbitmq` directly. All clients publish
and subscribe to one topic/routing_key: `webstomp-chat-example`
