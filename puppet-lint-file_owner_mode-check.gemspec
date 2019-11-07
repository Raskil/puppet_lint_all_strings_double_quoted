Gem::Specification.new do |spec|
  spec.name        = 'puppet-lint-all_strings_double_quoted-check'
  spec.version     = '1.0.0'
  spec.homepage    = 'https://sfbk445063.sf-bk.de/scm/bs/puppet-lint-all_strings_double_quoted-check.git'
  spec.license     = 'Nonstandard'
  spec.author      = 'Benjamin Fischer'
  spec.email       = 'raskil2000@gmail.com'
  spec.files       = Dir[
    'README.md',
    'LICENSE',
    'lib/**/*',
    'spec/**/*',
  ]
  spec.test_files  = Dir['spec/**/*']
  spec.summary     = 'A puppet-lint plugin to make sure all strings are double quoted.'
  spec.description = <<-EOF
    A puppet-lint plugin to make sure all strings are double quoted.
  EOF

  spec.add_dependency             'puppet-lint', '~> 2.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-collection_matchers', '~> 1.0'
  spec.add_development_dependency 'rspec-its', '~> 1.0'
  spec.add_development_dependency 'simplecov', '~> 0.16'
end
