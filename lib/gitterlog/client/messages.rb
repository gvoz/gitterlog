module GitterLog
  class Client

    module Messages

      def messages(roomId, options = {})
        get("/rooms/#{roomId}/chatMessages", options)
      end

      def create_message(roomId, options = {})
        post("/rooms/#{roomId}/chatMessages", options)
      end

    end

  end
end
