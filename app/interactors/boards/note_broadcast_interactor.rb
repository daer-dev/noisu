# frozen_string_literal: true

module Boards
  class NoteBroadcastInteractor
    attr_accessor :board_slug,
                  :note_id

    def initialize(board_slug:, note_id:)
      @board_slug = board_slug
      @note_id    = note_id
    end

    def run
      self.broadcast
    end

    protected

      def broadcast
        board = Board.friendly.find(self.board_slug)

        BoardsNotesChannel.broadcast_to(board.broadcast, html: self.note_html)
      end

      def note_html
        note           = Note.find(self.note_id)
        note_decorator = Boards::NoteDecorator.new(note)

        ApplicationController.renderer.new.render 'notes/note', note_decorator: note_decorator
      end
  end
end
