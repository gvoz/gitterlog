# Gitter ruby log

Client library for saving messages from [Gitter](https://gitter.im) use [Gitter API](https://developer.gitter.im/docs).

## Usage

Not use environment variables:

```ruby
client = GitterLog::Client.new("MY_API_TOKEN")
log = GitterLog::Log.new(client)
```

Use environment variables:

```ruby
ENV["GITTER_ACCESS_TOKEN"] = "MY_API_TOKEN"
log = GitterLog::Log.new
```

## Log

Save messages from one room

```ruby
log.log_room(roomId)
```

Save messages from all rooms

```ruby
log.log_rooms
```
