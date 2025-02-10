
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "consistency_check/version"

Gem::Specification.new do |spec|
  spec.name          = "consistency_check"
  spec.version       = ConsistencyCheck::VERSION
  spec.authors       = ["Michal Kováč"]
  spec.email         = ["miso@consistency_check.gem.ksp.sk"]

  spec.summary       = %q{Run custom consistency checks against your DB and track the results.}
  spec.homepage      = "https://github.com/mirelon/consistency_check"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rails", "~> 8.0"
  spec.add_runtime_dependency "activerecord", "~> 8.0"
  spec.add_development_dependency "bundler", "~> 2.6"
  spec.add_development_dependency "rake", "~> 13.2"
  spec.add_development_dependency "minitest", "~> 5.25"
end
