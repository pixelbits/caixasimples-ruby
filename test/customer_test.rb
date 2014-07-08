require 'test_helper'

class CustomerTest < MiniTest::Test
  def setup
    @customer = CaixaSimples::Customer.new
  end

  def test_endpoint
    assert_equal @customer.class.resource_endpoint, '/api/customers'
  end
end
