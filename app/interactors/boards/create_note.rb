# frozen_string_literal: true

module Boards
  class CreateNote
    include Interactor::Organizer

    organize Boards::ValidateNote,
             Boards::PersistNote,
             Boards::BroadcastNote,
             Boards::CreateNotification
  end
end
