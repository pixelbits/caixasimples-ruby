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
      self.class.post(endpoint, body: params)
    end

    def query
      self.class.get(endpoint, query: params)
    end

    def update
      self.class.patch("#{endpoint}/#{params[:id]}", query: params)
    end

    def find(id)
      self.class.get("#{endpoint}/#{id}", query: params)
    end

    private
    def endpoint
      "/api/#{resource_endpoint}"
    end
  end
end
