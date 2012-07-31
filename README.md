# FaradayMiddleware::MultiJson

A simple Faraday middleware that parses JSON responses with MultiJson for unobtrusiveness.

## Installation

Add this line to your application's Gemfile:

    gem 'faraday_middleware-multi_json'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install faraday_middleware-multi_json

## Usage

The same as FaradayMiddleware::ParseJson:

```
require 'faraday_middleware/multi_json'

connection = Faraday.new do |conn|
  conn.response :multi_json
  conn.adapter  Faraday.default_adapter
end

connection.get('http://example.com/example.json')
```

### Passing parser options

```
conn.response :multi_json, symbolize_keys: true
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
