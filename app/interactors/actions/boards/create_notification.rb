# frozen_string_literal: true

module Actions
  module Boards
    class CreateNotification
      include Interactor::Organizer

      organize Services::Boards::ValidateNotification,
               Services::Boards::BroadcastNotification
    end
  end
end
