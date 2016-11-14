module GitterLog

  class Log
    # Set the client
    attr_accessor :client

    def initialize(client = Client.new)
      @client = client
      @client.rooms.each do |x|
        save_room_messages(x["id"])
      end
    end

    def save_room_messages(roomId)
      date_message = ''
      @client.messages(roomId).each do |x|
        if date_message == Date.parse(x["sent"]).strftime("%d_%m_%Y")
          mode = 'a'
        else
          date_message = Date.parse(x["sent"]).strftime("%d_%m_%Y")
          mode = 'w'
        end
        f = File.open("logs/#{roomId}_#{date_message}.txt", mode)
        f.puts "#{x["fromUser"]["username"]}: #{x["text"]}"
        f.close
      end
    end

  end
end
