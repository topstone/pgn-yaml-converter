# frozen_string_literal: true

require_relative "lib/pgn_yaml_converter/version"

Gem::Specification.new do |spec|
  spec.name = "pgn-yaml-converter"
  spec.version = PgnYamlConverter::VERSION
  spec.authors = ["ISHIKAWA Takayuki"]
  spec.email = ["topstone@users.noreply.github.com"]

  spec.summary = "PGN-YAML converter"
  # spec.description = ""
  # spec.homepage = "TODO: Put your gem's website or public repo URL here."
  spec.required_ruby_version = ">= 3.3.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "bundler"
  spec.add_dependency "rspec"
  spec.add_dependency "rubocop-rake"
  spec.add_dependency "rubocop-rspec"
  spec.add_dependency "sord"
  spec.add_dependency "yard"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata["rubygems_mfa_required"] = "true"
end