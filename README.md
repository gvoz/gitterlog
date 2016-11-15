# Gitter ruby log

Client library for saving messages to [Gitter](https://developer.gitter.im/docs).

## Usage

Not use environment variables:

```ruby
client = GitterLog::Client.new("MY_API_TOKEN")
GitterLog::Log.new(client)
```

Use environment variables:

```ruby
ENV["GITTER_ACCESS_TOKEN"] = "MY_API_TOKEN"
GitterLog::Log.new
```
