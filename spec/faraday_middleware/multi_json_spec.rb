require 'spec_helper'

describe FaradayMiddleware::MultiJson do
  it 'parses the response body' do
    body = ::MultiJson.dump a: 1, b: 2

    connection = Faraday.new do |conn|
      conn.response :multi_json
      conn.adapter :test do |stub|
        stub.get('/') do
          [200, {}, body]
        end
      end
    end

    connection.get('/').body.should == { a: 1, b: 2 }
  end
end
