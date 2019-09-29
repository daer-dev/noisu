# frozen_string_literal: true

module Services
  module Boards
    class PersistNote
      include Interactor

      def call
        context.board = Board.friendly.find(context.board_slug)
        context.note  = Note.new(context.note_attrs.merge(board: context.board))

        context.fail! unless context.note.save
      end

      def rollback
        context.note.destroy
      end
    end
  end
end
