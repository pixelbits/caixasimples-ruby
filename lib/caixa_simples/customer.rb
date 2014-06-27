module CaixaSimples
  class Customer < Contact
    def resource_endpoint
      '/api/customers'
    end
  end
end
