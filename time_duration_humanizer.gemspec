# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'time_duration_humanizer/version'

Gem::Specification.new do |spec|
  spec.name          = "time_duration_humanizer"
  spec.version       = TimeDurationHumanizer::VERSION
  spec.authors       = ["Nikolay Digaev"]
  spec.email         = ["ffs.cmp@gmail.com"]

  spec.summary       = %q{A Ruby gem for converting seconds into human-readable format.}
  spec.description   = %q{A Ruby gem for converting seconds into human-readable format (12345 => "3 hours, 25 minutes and 45 seconds").}
  spec.homepage      = "https://github.com/digaev/time_duration_humanier"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "test"]

  spec.required_ruby_version = ">= 1.9.3"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
