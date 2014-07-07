require 'test_helper'
require 'minitest/mock'

class RestfulTest < MiniTest::Test
  def setup
    @resource_endpoint = '/api/suppliers'
    @params = { api_key: '1234' }
  end

  def test_create
    @params[:supplier] = { name: 'nando', reference_code: 2341243 }
    @restful = CaixaSimples::Restful.new(@params, @resource_endpoint)

    response = VCR.use_cassette(:restful_create) { @restful.create }
    assert_equal response.code, 201
  end

  def test_query
    @params.merge(name: 'nando', reference_code: 2341243)
    restful = CaixaSimples::Restful.new(@params, @resource_endpoint)

    response = VCR.use_cassette(:restful_get) { restful.query }
    assert_equal response.first['name'], 'nando'
  end

  def test_find
    restful = CaixaSimples::Restful.new(@params, @resource_endpoint)
    response = VCR.use_cassette(:restful_find) { restful.find(22) }
    assert_equal response['name'], 'nando'
  end
end
