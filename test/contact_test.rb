require 'test_helper'

class ContactTest < MiniTest::Test
  def setup
    @contact = CaixaSimples::Contact.new(
      name: 'Nando Sousa',
      legal_person: true,
      federal_registry: '22.222.222/000-33',
      state_registry: '222000033393',
      phone: '93 91098215',
      reference_code: 1,
      address: {
        street: 'Avenue de France',
        number: '303',
        district: "Place de l'Europe",
        city: 'Kourou',
        postal_code: '681140'
      }
    )
  end

  def assert_request_attribute(attribute, value)
    assert_equal @contact.request_attributes[attribute], value
  end


  def test_endpoint
    assert_equal @contact.class.resource_endpoint, '/api/contacts'
  end

  def test_perform_request_attributes
    assert_request_attribute :name, @contact.name
    assert_request_attribute :legal_person, @contact.legal_person
    assert_request_attribute :federal_registry, @contact.federal_registry
    assert_request_attribute :state_registry, @contact.state_registry
    assert_request_attribute :phone, @contact.phone
    assert_request_attribute :reference_code, @contact.reference_code
    assert_request_attribute :address_attributes, @contact.address
  end

  def text_dont_send_if_value_is_empty
    @contact.phone = nil
    @contact.reference_code = nil
    refute @contact.request_attributes.key?(:phone)
    refute @contact.request_attributes.key?(:reference_code)
  end
end
