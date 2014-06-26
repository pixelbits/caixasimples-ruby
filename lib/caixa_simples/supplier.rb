module CaixaSimples
  class Supplier < Contact
    def endpoint
      CaixaSimples::API_ENDPOINT + '/suppliers'
    end
  end
end
