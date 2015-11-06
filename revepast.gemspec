# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'revepast/version'

Gem::Specification.new do |spec|
  spec.name          = 'revepast'
  spec.version       = Revepast::VERSION
  spec.authors       = ['Mekaret Eriker']
  spec.email         = ['mekaret@revhosts.net']

  spec.summary       = 'A Ruby library to help parse various things that are copy/pastable from the Eve Online'
  spec.description   = 'A Ruby library to help parse various things that are copy/pastable from the Eve Online'
  spec.homepage      = 'https://github.com/IceProd/revepast'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    fail 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency('rake')
  spec.add_dependency('bundler')
  spec.add_development_dependency('pry')
  spec.add_development_dependency('awesome_print')
  spec.add_development_dependency('json')
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('simplecov')
end
