# frozen_string_literal: true

module Boards
  class ValidateNote
    include Interactor

    def call
      note_validator = Boards::NoteValidator.new(context.note_attrs)

      unless note_validator.valid?
        context.errors = note_validator.errors

        context.fail!
      end
    end
  end
end
