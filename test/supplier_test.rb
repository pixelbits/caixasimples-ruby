require 'test_helper'

class SupplierTest < MiniTest::Test
  def setup
    @supplier = CaixaSimples::Supplier.new
  end

  def test_endpoint
    assert_equal @supplier.endpoint, 'http://www.caixasimples.com/api/suppliers'
  end
end
