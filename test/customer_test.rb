require 'test_helper'

class CustomerTest < MiniTest::Test
  def setup
    @customer = CaixaSimples::Customer.new
  end

  def test_endpoint
    assert_equal CaixaSimples::Customer::RESOURCE_ENDPOINT, '/api/customers'
  end
end
