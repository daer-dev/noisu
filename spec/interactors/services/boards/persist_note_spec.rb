# frozen_string_literal: true

require "rails_helper"

describe ::Services::Boards::PersistNote do
  describe ".call" do
    context "when given an existent board's slug and valid note's attributes" do
      let(:board)       { create(:board, :with_notes) }
      let(:note_attrs)  { board.notes.first.attributes.except("id") }

      subject(:context) {
        described_class.call(
          board_slug: board.slug,
          note_attrs: note_attrs
        )
      }

      it "provides a board" do
        expect(context.board).to eq(board)
      end

      it "sets the provided attrs to the created note" do
        expect(context.note.attributes.except("id")).to eq(note_attrs)
      end

      it "provides a persisted note" do
        expect(context.note).to be_persisted
      end

      it "succeeds" do
        expect(context).to be_a_success
      end

      context "but its chained to other interactors and has to be rolled back" do
        before do
          context.rollback
        end

        it "destroys the previously created note" do
          expect(context.note).to be_destroyed
        end
      end
    end

    context "when no board slug is given" do
      subject(:context) {
        described_class.call(
          board_slug: nil,
          note_attrs: { content: generate(:text) }
        )
      }

      it "fails" do
        expect(context).to be_a_failure
      end
    end

    context "when no note attributes are given" do
      let(:board) { create(:board) }

      subject(:context) {
        described_class.call(
          board_slug: board.slug,
          note_attrs: nil
        )
      }

      it "fails" do
        expect(context).to be_a_failure
      end
    end
  end
end
