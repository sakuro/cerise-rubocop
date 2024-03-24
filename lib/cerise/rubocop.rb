# frozen_string_literal: true

require "hanami/cli"
require "zeitwerk"

# @see Cerise::RuboCop
module Cerise
  # RuboCop support for Hanami application.
  module RuboCop
    # @api private
    # rubocop:disable Metrics/MethodLength
    def self.gem_loader
      @gem_loader ||= Zeitwerk::Loader.new.tap do |loader|
        root = File.expand_path("..", __dir__)
        loader.tag = "cerise-rubocop"
        loader.inflector = Zeitwerk::GemInflector.new("#{root}/cerise-rubocop.rb")
        loader.push_dir(root)
        loader.ignore(
          "#{root}/cerise-rubocop.rb",
          "#{root}/cerise/rubocop/{commands/install,rake_tasks,version}.rb"
        )
        loader.inflector.inflect("rubocop" => "RuboCop")
      end
    end
    # rubocop:enable Metrics/MethodLength

    gem_loader.setup

    require_relative "rubocop/version"

    require_relative "rubocop/commands/install"
    require_relative "rubocop/rake_tasks"

    Hanami::CLI.after "install", Commands::Install if Hanami::CLI.within_hanami_app?
  end
end
