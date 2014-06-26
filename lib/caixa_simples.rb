require 'httparty'
require 'caixa_simples/contact'
require 'caixa_simples/supplier'
require 'caixa_simples/customer'
require 'caixa_simples/restful'

module CaixaSimples
  API_ENDPOINT = 'http://www.caixasimples.com'

  def self.api_key
    @api_key ||= ENV['CAIXA_SIMPLES_API_KEY']
  end
end
