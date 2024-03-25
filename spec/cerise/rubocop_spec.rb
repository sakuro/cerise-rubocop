# frozen_string_literal: true

RSpec.describe Cerise::RuboCop do
  it "defines Rake tasks for running RuboCop" do
    # RuboCop::RakeTask also defines "rubocop:auto_correct" but it is already deprecated.
    expected_tasks = %w[rubocop rubocop:autocorrect rubocop:autocorrect_all]

    Hanami::CLI::RakeTasks.install_tasks

    actual_tasks = Rake.application.tasks.map(&:name)

    expect(actual_tasks).to include(*expected_tasks)
  end
end
