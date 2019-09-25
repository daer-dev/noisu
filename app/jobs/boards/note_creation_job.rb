# frozen_string_literal: true

module Boards
  class NoteCreationJob < ApplicationJob
    queue_as :boards

    def perform(board_slug:, note_attrs:)
      Boards::CreateNote.call(
        board_slug: board_slug,
        note_attrs: note_attrs
      )
    end
  end
end
