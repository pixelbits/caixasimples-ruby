module CaixaSimples
  class Customer < Contact
    def resource_endpoint
      '/api/customers'
    end

    def required_key
      :customer
    end
  end
end
