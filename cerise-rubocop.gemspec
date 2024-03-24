# frozen_string_literal: true

require_relative "lib/cerise/rubocop/version"

Gem::Specification.new do |spec|
  spec.name = "cerise-rubocop"
  spec.version = Cerise::RuboCop::VERSION
  spec.authors = ["OZAWA Sakuro"]
  spec.email = ["10973+sakuro@users.noreply.github.com"]

  spec.summary = "RuboCop for Hanami"
  spec.description = "RuboCop integration for Hanami"
  spec.homepage = "https://github.com/sakuro/cerise-rubocop"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.3.0"


  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "#{spec.homepage}.git"
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "hanami-cli", "~> 2.1.0"
  spec.add_dependency "rubocop", "~> 1.62"
  spec.add_dependency "zeitwerk", "~> 2.6"
end
