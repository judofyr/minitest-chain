# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name     = "minitest-chain"
  s.version  = "0.5.1"
  s.date     = "2013-04-25"
  s.summary  = "Chainable assertions for MiniTest"
  s.email    = "judofyr@gmail.com"
  s.homepage = "https://github.com/judofyr/minitest-chain"
  s.authors  = ['Magnus Holm']
  
  s.description = s.summary
  
  s.files         = Dir['{test,lib}/*']
  s.test_files    = Dir['test/**/*'] + Dir['spec/**/*']

  s.add_runtime_dependency('minitest', '~> 4.0')
end
