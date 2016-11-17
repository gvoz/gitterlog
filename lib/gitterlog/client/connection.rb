module GitterLog

  class Client

    module Connection

      def get(path, options = {})
        request :get, path, options
      end

      def post(path, options = {})
        request :post, path, options
      end

      private

      def request(http_method, path, options)
        if http_method == :post
          response = self.class.send(http_method, path, { body: options })
        else
          response = self.class.send(http_method, path, { query: options })
        end
        response.parsed_response
      end

    end

  end
end

