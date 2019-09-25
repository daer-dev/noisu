# frozen_string_literal: true

module Boards
  class CreateNotification
    include Interactor::Organizer

    organize Boards::ValidateNotification,
             Boards::BroadcastNotification
  end
end
