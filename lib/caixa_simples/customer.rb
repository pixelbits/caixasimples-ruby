module CaixaSimples
  class Customer < Contact

    def endpoint
     CaixaSimples::API_ENDPOINT + '/customers'
    end
  end
end
