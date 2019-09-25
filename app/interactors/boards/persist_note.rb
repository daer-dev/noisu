# frozen_string_literal: true

module Boards
  class PersistNote
    include Interactor

    def call
      context.board = Board.friendly.find(context.board_slug)
      context.note  = Note.new(context.record_attrs.merge(board: board))

      context.fail! unless note.save
    end

    def rollback
      context.record.destroy
    end
  end
end
