# -*- encoding: utf-8 -*-
require File.expand_path('../lib/vagrant-nxos/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "vagrant-nxos"
  spec.version       = VagrantPlugins::GuestNxOS::VERSION
  spec.authors       = ["stanley karunditu"]
  spec.email         = ["stanley@linuxsimba.com"]
  spec.description   = "NxOS Guest Support for Vagrant"
  spec.summary       = "A small gem that adds nxos guest support to vagrant."
  spec.homepage      = "https://github.com/linuxsimba/vagrant-nxos"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($\)
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths  = ["lib"]

  spec.required_ruby_version     = ">= 2.2"
  spec.required_rubygems_version = ">= 1.3.6"
  spec.rubyforge_project = "vagrant-nxos"

  spec.add_development_dependency "bundler", ">= 1.12.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec-core", ">= 3.4.3"
  spec.add_development_dependency "rspec-expectations", ">= 3.4.0"
end
