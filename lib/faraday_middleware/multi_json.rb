require 'faraday_middleware/response_middleware'

module FaradayMiddleware
  class MultiJson < ResponseMiddleware
    dependency 'multi_json'
    define_parser do |body|
      ::MultiJson.load(body, symbolize_keys: true) unless body.strip.empty?
    end
  end
end

Faraday.register_middleware :response, :multi_json => FaradayMiddleware::MultiJson
