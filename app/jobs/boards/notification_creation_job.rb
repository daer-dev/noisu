# frozen_string_literal: true

module Boards
  class NotificationCreationJob < ApplicationJob
    queue_as :boards

    def perform(board_slug:, notification_attrs:)
      Actions::Boards::CreateNotification.call(
        board_slug:         board_slug,
        notification_attrs: notification_attrs
      )
    end
  end
end
