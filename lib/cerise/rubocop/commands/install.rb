# frozen_string_literal: true

require "erb"

require "hanami/cli/command"

# @see Cerise::RuboCop::Commands::Install
module Cerise
  # @see Cerise::RuboCop::Commands::Install
  module RuboCop
    # @see Cerise::RuboCop::Commands::Install
    module Commands
      # @api private
      class Install < Hanami::CLI::Command
        # Installs initial RuboCop configuration files.
        #
        # - .rubocop.yml - configuration file
        # - .rubocop - command line options
        #
        # @api private
        def call(*, **)
          copy_dot_rubocop
          copy_dot_rubocop_yml
        end

        private def copy_dot_rubocop
          fs.cp(
            fs.expand_path(fs.join(__dir__, "..", "generators", "dot.rubocop")),
            fs.expand_path(fs.join(".rubocop"))
          )
        end

        private def copy_dot_rubocop_yml
          content = File.read(fs.join(__dir__, "..", "generators", "dot.rubocop.yml"))

          fs.write(
            fs.expand_path(fs.join(".rubocop.yml")),
            ERB.new(content, trim_mode: "-").result
          )
        end
      end
    end
  end
end
