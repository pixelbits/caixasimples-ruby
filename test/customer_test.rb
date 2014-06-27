require 'test_helper'

class CustomerTest < MiniTest::Test
  def setup
    @customer = CaixaSimples::Customer.new
  end

  def test_endpoint
    assert_equal @customer.resource_endpoint, '/api/customers'
  end

  def test_required_key
    assert_equal @customer.required_key, :customer
  end
end
