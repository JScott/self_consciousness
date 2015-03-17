Gem::Specification.new do |gem|
  gem.name        = 'self_consciousness'
  gem.version     = '0.0.1'
  gem.licenses    = 'MIT'
  gem.authors     = ['Justin Scott']
  gem.email       = 'jvscott@gmail.com'
  gem.homepage    = 'http://www.github.com/jscott/self_consciousness/'
  gem.summary     = 'Self Identity'
  gem.description = 'Allowing programs to introspect and report on their own functionality.'

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- kintama/**/*`.split("\n")

  gem.add_runtime_dependency 'colorize'
  gem.add_runtime_dependency 'moneta'
  gem.add_runtime_dependency 'self_identity'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'kintama'
end
