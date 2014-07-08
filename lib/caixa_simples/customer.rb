module CaixaSimples
  class Customer < Contact
    def self.resource_endpoint
      :customers
    end
  end
end
