$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'caixa_simples/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'caixa_simples'
  s.version     = CaixaSimples::VERSION
  s.authors     = ['Nando Sousa']
  s.email       = ['nandosousafr@gmail.com']
  s.homepage    = 'http://caixasimples.com'
  s.summary     = 'CaixaSimples API wrapper'
  s.description = 'CaixaSimples API wrapper'
  s.license     = 'MIT'

  s.files = Dir['{lib}/**/*', "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir['test/**/*']
  s.require_paths = ['lib']

  s.add_dependency 'httparty'

  s.add_development_dependency 'minitest'
  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
end
