# frozen_string_literal: true

require "tmpdir"

RSpec.describe Cerise::RuboCop::Commands::Install do
  describe "#call" do
    subject(:install) { described_class.new(fs:) }

    let(:fs) { Dry::Files.new }
    let(:dir) { Dir.mktmpdir }

    let(:arbitrary_argument) { {} }

    around do |example|
      fs.chdir(dir) { example.run }
    ensure
      fs.delete_directory(dir)
    end

    it "copies .rubocop" do
      install.call(arbitrary_argument)

      dot_rubocop = <<~DOT_RUBOCOP
        --display-cop-names
        --display-style-guide
        --extra-details
      DOT_RUBOCOP

      expect(fs.read(".rubocop")).to eq(dot_rubocop)
    end

    it "copies .rubocop.yml" do
      install.call(arbitrary_argument)

      dot_rubocop_yml = <<~DOT_RUBOCOP_YML
        inherit_from:
          # - .rubocop_todo.yml

        AllCops:
          TargetRubyVersion: #{RUBY_VERSION.split(".")[0, 2].join(".")}
          Exclude:
            - bin/**/*
            - vendor/**/*
      DOT_RUBOCOP_YML

      expect(fs.read(".rubocop.yml")).to eq(dot_rubocop_yml)
    end
  end
end
