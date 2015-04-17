$LOAD_PATH.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'factor-connector-irc'
  s.version       = '3.0.0'
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Justin Speers']
  s.email         = ['speersj@fastmail.com']
  s.homepage      = 'https://factor.io'
  s.summary       = 'IRC Factor.io Connector'
  s.files         = Dir.glob('lib/factor-connector-irc.rb')

  s.require_paths = ['lib']

  s.add_development_dependency 'rspec', '~> 3.2.0'
  s.add_development_dependency 'rake', '~> 10.4.2'
  s.add_development_dependency 'codeclimate-test-reporter', '~> 0.4.7'

  s.add_runtime_dependency 'irconnect', '0.0.32'
end
