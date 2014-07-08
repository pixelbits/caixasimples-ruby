require 'test_helper'
require 'minitest/mock'

class RestfulTest < MiniTest::Test
  def setup
    @resource_endpoint = :suppliers
    @params = { name: 'nando', reference_code: 2341243 }
  end

  def test_create
    @restful = CaixaSimples::Restful.new(@params, @resource_endpoint)

    response = VCR.use_cassette(:restful_create) { @restful.create }
    assert_equal response.code, 201
  end

  def test_query
    restful = CaixaSimples::Restful.new(@params, @resource_endpoint)

    response = VCR.use_cassette(:restful_get) { restful.query }
    assert_equal response.first['name'], 'nando'
  end

  def test_find
    restful = CaixaSimples::Restful.new(@params, @resource_endpoint)
    response = VCR.use_cassette(:restful_find) { restful.find(221) }
    assert_equal response['name'], 'nando'
  end

  def test_update
    @params = { name: 'Americanas' }
    request = CaixaSimples::Restful.new(@params, @resource_endpoint)
    supplier = VCR.use_cassette(:restful_create_supplier) { request.create }

    @params.merge!(id: supplier['id'], name: 'Americanas.com')
    request = CaixaSimples::Restful.new(@params, @resource_endpoint)
    updated_supplier = VCR.use_cassette(:restful_update) { request.update }

    assert_equal updated_supplier['name'], 'Americanas.com'
  end
end

