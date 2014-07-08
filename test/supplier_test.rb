require 'test_helper'

class SupplierTest < MiniTest::Test
  def setup
    @supplier = CaixaSimples::Supplier.new
  end

  def test_endpoint
    assert_equal @supplier.class.resource_endpoint, '/api/suppliers'
  end
end
