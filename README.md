# CaixaSimples Ruby

__under development__


### Cadastrando Cliente e Fornecedor

```ruby
  require 'caixa_simples'

  # se cliente
  cliente = CaixaSimples::Customer.new

  # se fornecedor
  fornecedor = CaixaSimples::Supplier.new

  # nome
  cliente.name                = 'Fernando Sousa'

  # informe true se é o cliente é pessoa jurídica
  cliente.legal_person        = false

  # CPF/CNPJ
  cliente.federal_registry    = '884.334.003-32'

  # inscrição estadual
  cliente.state_registry      = '9993323323223'

  # endereço

  cliente.address = {
    street: 'Avenue des Isles'
    number: '2993',
    district: "Place de l'Europe",
    city: 'Kourou',
    state: 'Guiane Française'
  }

  # enviar os dados ao CaixaSimples
  cliente.create

```

