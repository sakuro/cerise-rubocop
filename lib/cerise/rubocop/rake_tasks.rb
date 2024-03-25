# frozen_string_literal: true

Hanami::CLI::RakeTasks.register_tasks do
  require "rubocop/rake_task"

  RuboCop::RakeTask.new
end
