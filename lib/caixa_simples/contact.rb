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

    def self.resource_endpoint
      '/api/contacts'
    end

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
      }.select { |_k, v| !v.to_s.empty? }
    end

    def required_key
      :contact
    end

    def create
      request_params = { required_key => request_attributes }
      Restful.new(request_params, self.resource_endpoint).create
    end

    def self.query(search_fields)
      Restful.new(search_fields, resource_endpoint).query
    end

    def self.find(id)
      Restful.new({}, resource_endpoint).find(id)
    end
  end
end
