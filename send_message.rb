msg = ARGV[0]

require 'bunny'

routing_key = 'webstomp-chat-example'

rabbit = Bunny.new
rabbit.start
channel = rabbit.create_channel
exchange = channel.topic(routing_key, :auto_delete => true)
exchange.publish(msg, :routing_key => routing_key)
rabbit.close
