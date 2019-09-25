# frozen_string_literal: true

module Boards
  class BroadcastNote
    include Interactor

    def call
      context.fail! unless self.broadcast!
    end

    private

      def broadcast!
        BoardsNotesChannel.broadcast_to(context.note.board.broadcast, html: self.note_html)
      end

      def note_html
        note_decorator = Boards::NoteDecorator.new(context.note)

        ApplicationController.renderer.new.render 'notes/note', note_decorator: note_decorator
      end
  end
end
