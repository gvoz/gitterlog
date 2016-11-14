module GitterLog
  class Client

    module Rooms

      def rooms(options = {})
        get("/rooms", options)
      end

    end

  end
end
