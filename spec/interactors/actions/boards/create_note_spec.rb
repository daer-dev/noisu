# frozen_string_literal: true

require "rails_helper"

describe ::Actions::Boards::CreateNote do
  let(:services) {
    [
      Services::Boards::ValidateNote,
      Services::Boards::PersistNote,
      Services::Boards::BroadcastNote
    ]
  }

  it "has the required services included and in the correct order" do
    expect(described_class.organized).to eq(services)
  end
end
