module CaixaSimples
  class Customer < Contact
    def self.resource_endpoint
      '/api/customers'
    end

    def required_key
      :customer
    end
  end
end
