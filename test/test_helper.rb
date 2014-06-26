Bundler.require(:default)
require 'minitest/autorun'
require 'minitest/pride'
require 'vcr'

ENV['RACK_ENV'] = 'test'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

VCR.configure do |c|
  c.cassette_library_dir = 'test/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.filter_sensitive_data('<API_KEY>') { ENV['CAIXA_SIMPLES_API_KEY'] }
  c.default_cassette_options = { match_requests_on: [:method] }
end


