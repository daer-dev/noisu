# frozen_string_literal: true

require "delegate"

module Boards
  class NoteDecorator < SimpleDelegator
    def note
      __getobj__
    end

    def content
      note.content.truncate(100, separator: " ")
    end
  end
end
