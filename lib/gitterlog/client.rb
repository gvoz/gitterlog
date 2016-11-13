require "gitterlog/client/rooms"

module GitterLog

  class Client
    include HTTParty
    include GitterLog::Client::Rooms

    base_uri "https://api.gitter.im/v1"
    format :json

    def initialize(access_token = nil)
      access_token ||= ENV["GITTER_ACCESS_TOKEN"]
      self.class.default_options.merge!(headers: { 'Authorization' => "Bearer #{access_token}" })
    end
  end
end
