Gem::Specification.new do |gem|
  gem.name        = 'self_consciousness'
  gem.version     = '0.1.0'
  gem.licenses    = 'MIT'
  gem.authors     = ['Justin Scott']
  gem.email       = 'jvscott@gmail.com'
  gem.homepage    = 'http://www.github.com/jscott/self_consciousness/'
  gem.summary     = 'Self Consciousness'
  gem.description = 'Allowing code to introspect and report on its own functionality.'

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- kintama/**/*`.split("\n")
  gem.executables   = `git ls-files -- bin/self_consciousness`.split("\n").map { |f| File.basename(f) }

  gem.add_runtime_dependency 'colorize'
  gem.add_runtime_dependency 'moneta'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'kintama'
end
