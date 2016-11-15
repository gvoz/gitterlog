module GitterLog

  class Log
    # Set the all messages in room
    attr_accessor :all_messages

    # Set the client
    attr_accessor :client

    def initialize(client = Client.new)
      if Dir["logs"].empty?
        Dir.mkdir("logs")
      end
      @client = client
    end

    def log_room(roomId)
      @all_messages = []
      get_room_messages(roomId)
      save_files(roomId)
    end

    def log_rooms
      @client.rooms.each do |x|
        log_room(x["id"])
      end
    end

    private

    def get_room_messages(roomId)
      date_message = ''
      before_id = ''
      messages = @client.messages(roomId, {beforeId: before_id})
      until messages.empty? do
        before_id = messages[0]["id"]
        messages.reverse_each do |m|
          unless date_message == date_parse(m["sent"])
            date_message = date_parse(m["sent"])
            # exit if file exist
            return unless Dir["logs/#{roomId}_#{date_message}.txt"].empty?
          end
          # not log today messages
          unless date_message == DateTime.now.strftime("%Y_%m_%d")
            @all_messages << [date_message, "#{m["fromUser"]["username"]}: #{m["text"].delete("\n")}"]
          end
        end
          messages = @client.messages(roomId, {beforeId: before_id})
      end
    end

    def save_files(roomId)
      date_message = ''
      @all_messages.reverse_each do |m|
        unless date_message == m[0]
          date_message = m[0]
        end
        File.open("logs/#{roomId}_#{date_message}.txt", 'a') { |f| f.puts "#{m[1]}"}
      end
    end

    def date_parse(date)
      Date.parse(date).strftime("%Y_%m_%d")
    end

  end
end
