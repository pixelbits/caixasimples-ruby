require 'test_helper'

class SupplierTest < MiniTest::Test
  def setup
    @supplier = CaixaSimples::Supplier.new
  end

  def test_endpoint
    assert_equal @supplier.resource_endpoint, '/api/suppliers'
  end

  def test_required_key
    assert_equal @supplier.required_key, :supplier
  end
end
