require 'test_helper'

class SupplierTest < MiniTest::Test
  def setup
    @supplier = CaixaSimples::Supplier.new
  end

  def test_endpoint
    assert_equal CaixaSimples::Supplier::RESOURCE_ENDPOINT, '/api/suppliers'
  end
end
