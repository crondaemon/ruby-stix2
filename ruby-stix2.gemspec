lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "stix2/version"

Gem::Specification.new do |spec|
  spec.name = "ruby-stix2"
  spec.version = Stix2::VERSION
  spec.summary = "Ruby implementation for the STIX protocol version 2.1"
  spec.description = "Ruby implementation for the STIX protocol version 2.1. Full specs: https://docs.oasis-open.org/cti/stix/v2.1/stix-v2.1.html"
  spec.authors = ["Dario Lombardo"]
  spec.email = "lomato@gmail.com"

  spec.require_paths = ["lib"]
  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.homepage = "https://rubygemspec.org/gems/stix2"
  spec.license = "GPL-2.0-or-later"

  spec.required_ruby_version = ">= 2.7"

  spec.add_dependency "hashie", "~> 5.0.0"

  spec.add_development_dependency "bundler", "~> 2.3"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "pry", "~> 0.13.0"
  spec.add_development_dependency "pry-byebug", "~> 3.10.1"
  spec.add_development_dependency "minitest", "~> 5.18.1"
  spec.add_development_dependency "simplecov", "~> 0.22.0"
  spec.add_development_dependency "irb", "~> 1.7.0"
  spec.add_development_dependency "mutex_m"
  spec.add_development_dependency "standardrb"
end
