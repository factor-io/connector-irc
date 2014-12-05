$LOAD_PATH.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'factor-connector-irc'
  s.version       = '0.0.1'
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Justin Speers']
  s.email         = ['speersj@fastmail.com']
  s.homepage      = 'https://factor.io'
  s.summary       = 'IRC Factor.io Connector'
  s.files         = Dir.glob('lib/factor/connector/*.rb')

  s.require_paths = ['lib']

  s.add_development_dependency 'rspec', '~> 3.1.0'
  s.add_development_dependency 'rake', '~> 10.3.2'
  s.add_development_dependency 'codeclimate-test-reporter', '~> 0.4.1'

  s.add_runtime_dependency 'factor-connector-api', '~> 0.0.14'
  s.add_runtime_dependency 'cinch', '~> 2.1.0'
end
