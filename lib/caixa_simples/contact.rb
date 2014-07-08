module CaixaSimples
  class Contact

    attr_accessor :id
    attr_accessor :name
    attr_accessor :email

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
      :contacts
    end

    def initialize(args = {})
      args.each {|k, v| self.send("#{k}=", v) }
    end

    def request_attributes
      @request_attributes ||= {
        id: id,
        name: name,
        email: email,
        legal_person: legal_person,
        federal_registry: federal_registry,
        state_registry: state_registry,
        phone: phone,
        reference_code: reference_code,
        address_attributes: address
      }.select { |_k, v| !v.to_s.empty? }
    end

    def create
      Restful.new(request_attributes, self.class.resource_endpoint).create
    end

    def update
      Restful.new(request_attributes, self.class.resource_endpoint).update
    end

    def self.query(search_fields)
      Restful.new(search_fields, resource_endpoint).query
    end

    def self.find(id)
      Restful.new({}, resource_endpoint).find(id)
    end
  end
end
