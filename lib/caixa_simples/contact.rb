module CaixaSimples
  class Contact
    attr_accessor :name

    # this is a company?
    attr_accessor :legal_person
    attr_accessor :federal_registry
    attr_accessor :state_registry
    attr_accessor :phone

    # your own id
    attr_accessor :reference_code

    attr_accessor :address

    attr_reader :request_attributes

    attr_reader :result

    def initialize(args = {})
      args.each {|k, v| self.send("#{k}=", v) }
    end

    def request_attributes
      @request_attributes ||= {
        name: name,
        legal_person: legal_person,
        federal_registry: federal_registry,
        state_registry: state_registry,
        phone: phone,
        reference_code: reference_code,
        address_attributes: address
      }
    end

    def resource_endpoint
      '/api/contacts'
    end

    def create
      request_params = { self.name.downcase => request_attributes }
      @result ||= Restful.new(request_params, resource_endpoint).create
    end

    def query
      @result ||= Restful.new(request_attributes, resource_endpoint).query
    end

    def self.find(id)
      @result ||= Restful.new({}, resource_endpoint).find(id)
    end
  end
end
