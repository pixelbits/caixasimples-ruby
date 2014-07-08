module CaixaSimples
  class Supplier < Contact
    def self.resource_endpoint
      '/api/suppliers'
    end
  end
end
