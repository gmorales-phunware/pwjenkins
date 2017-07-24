# coding: utf-8
require File.expand_path("../lib/pwjenkins/version", __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "pwjenkins"
  spec.version       = Pwjenkins::VERSION
  spec.authors       = ["Gabe Morales"]
  spec.email         = ["gmorales@phunware.com"]

  spec.summary       = %q{Solution for Jerrod's problem.}
  spec.description   = %q{Solution for Jerrod's problem.}
  spec.homepage      = "https://rubygems.org/gems/pwjenkins"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "cucumber"
  spec.add_development_dependency "aruba"

  spec.add_dependency "thor"
  spec.add_dependency "cocoapods"
  spec.add_runtime_dependency "xcpretty"
  spec.add_dependency "rainbow", ">= 0"

  spec.files        = `git ls-files`.split("\n")
  spec.executables   << 'pwjenkins'
  spec.require_paths = ["lib"]
end
