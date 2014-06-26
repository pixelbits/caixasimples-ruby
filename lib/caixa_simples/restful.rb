module CaixaSimples
  class Restful
    include HTTParty

    attr_reader :params, :resource_endpoint

    def initialize(*args)
      self.class.base_uri ::CaixaSimples::API_ENDPOINT
      @params             = args.first
      @resource_endpoint  = args.last
      @params[:api_token] = ::CaixaSimples.api_key
    end

    def create
      self.class.post(resource_endpoint, body: params)
    end

    def query
      self.class.get(resource_endpoint, query: params)
    end

    def find(id)
      self.class.get("#{resource_endpoint}/#{id}", query: params)
    end
  end
end
