# frozen_string_literal: true

module Actions
  module Boards
    class CreateNote
      include Interactor::Organizer

      organize Services::Boards::ValidateNote,
               Services::Boards::PersistNote,
               Services::Boards::BroadcastNote
    end
  end
end
