# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'contactually/version'

Gem::Specification.new do |spec|
  spec.name          = "contactually-rb"
  spec.version       = Contactually::VERSION
  spec.authors       = ["Nick Blumenthal", "Nic Cavigliano", "Mykhailo Odyniuk"]
  spec.email         = ["nick@realscout.com", "ncavig@gmail.com", "m.odyniuk@gmail.com"]

  spec.summary       = 'Simple wrapper around Contactually v2 API'
  spec.description   = ''
  spec.homepage      = "https://github.com/RealScout/contactually-api"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday" #, "~> 0.14.0"
  spec.add_dependency "faraday_middleware", "~> 0.10.0"
  spec.add_dependency "memoist", "~> 0.16.0"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "codeclimate-test-reporter", "~> 0.6.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "webmock", "~> 2.1"
end
