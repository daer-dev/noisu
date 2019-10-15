require 'rails_helper'

describe ::Services::Boards::PersistNote do
  describe ".call" do
    context "when given valid credentials" do
      subject(:context) {
        described_class.call(
          board_slug:      board.slug,
          note_attributes: note.attrs
        )
      }

      before do
        board = build(:board, :with_notes)
        note  = board.notes.first
      end

      it "provides a board" do
        expect(context.board).to eq(board)
      end

      it "provides a persisted note" do
        expect(context.note).to eq(note)
      end

      it "succeeds" do
        expect(context).to be_a_success
      end
    end

    context "when no board slug is given" do
      subject(:context) {
        described_class.call(
          board_slug:      nil,
          note_attributes: { content: generate(:text) }
        )
      }

      it "fails" do
        expect(context).to be_a_failure
      end
    end

    context "when no note attributes are given" do
      subject(:context) {
        described_class.call(
          board_slug:      generate(:slug),
          note_attributes: nil
        )
      }

      it "fails" do
        expect(context).to be_a_failure
      end
    end

    context "when it fails for any reason" do
      subject(:context) { described_class.call.fail! }

      it "ensures to destroy the note if it was created" do
        expect(context.note).to be_blank
      end
    end
  end
end
