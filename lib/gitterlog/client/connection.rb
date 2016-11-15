module GitterLog

  class Client

    module Connection

      def get(path, options = {})
        request :get, path, options
      end

      private

      def request(http_method, path, options)
        response = self.class.send(http_method, path, { query: options })
        response.parsed_response
      end

    end

  end
end

