msg = ARGV[0]

require 'bunny'
require 'json'

routing_key = 'webstomp-chat-example'

rabbit = Bunny.new
rabbit.start
channel = rabbit.create_channel
exchange = channel.topic('amq.topic')
exchange.publish(JSON.generate( { author: "Ruby", text: msg } ), :routing_key => routing_key)
rabbit.close
