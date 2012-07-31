require 'faraday_middleware/response_middleware'

module FaradayMiddleware
  class MultiJson < ResponseMiddleware
    dependency 'multi_json'

    def parse(body)
      ::MultiJson.load(body, @options) unless body.strip.empty?
    end
  end
end

Faraday.register_middleware :response, multi_json: FaradayMiddleware::MultiJson
