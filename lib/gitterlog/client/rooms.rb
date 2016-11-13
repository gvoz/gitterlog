module GitterLog
  class Client

    module Rooms

      def rooms(options = {})
        response = self.class.get("/rooms", { query: options })
        response.parsed_response
      end

    end

  end
end
