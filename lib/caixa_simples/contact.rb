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

    def initialize(args = {})
      args.each {|k, v| self.send("#{k}=", v) }
    end

    def perform_request_attributes
      @request_attributes = {}

      @request_attributes[:name]                = name
      @request_attributes[:legal_person]        = legal_person
      @request_attributes[:federal_registry]    = federal_registry
      @request_attributes[:state_registry]      = state_registry
      @request_attributes[:phone]               = phone
      @request_attributes[:reference_code]      = reference_code
      @request_attributes[:address_attributes]  = address
    end
  end
end
