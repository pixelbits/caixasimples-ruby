module CaixaSimples
  class Supplier < Contact
    def self.resource_endpoint
      '/api/suppliers'
    end

    def required_key
      :supplier
    end
  end
end
