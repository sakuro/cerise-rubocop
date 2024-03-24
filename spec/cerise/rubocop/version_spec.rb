# frozen_string_literal: true

RSpec.describe "Cerise::RuboCop::VERSION" do
  it "returns version" do
    expect(Cerise::RuboCop::VERSION).to eq("0.1.0")
  end
end
