require 'spec_helper'

describe FaradayMiddleware::MultiJson do
  let(:json) { ::MultiJson.dump(a:1, b:2) }

  def connection(options={})
    Faraday.new do |builder|
      builder.response :multi_json, options
      builder.adapter :test do |stub|
        stub.get('/') do
          [200, {}, json]
        end
      end
    end
  end

  it 'should parse the response body' do
    connection.get('/').body.should == {'a'=>1, 'b'=>2}
  end

  it 'should delegate options given by builder' do
    connection(symbolize_keys: true).get('/').body.should == {a:1, b:2}
  end
end
