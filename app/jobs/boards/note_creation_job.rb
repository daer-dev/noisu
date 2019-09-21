# frozen_string_literal: true

module Boards
  class NoteCreationJob < ApplicationJob
    queue_as :boards

    def perform(board_slug:, note_attrs:)
      Boards::NoteCreationOrganizer.new(
        board_slug:   board_slug,
        record_attrs: note_attrs
      ).run
    end
  end
end
