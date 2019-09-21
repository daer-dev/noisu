# frozen_string_literal: true

module Boards
  class NotificationCreationJob < ApplicationJob
    queue_as :boards

    def perform(board_slug:, type:, text:)
      Boards::NotificationCreationOrganizer.new(
        board_slug: board_slug,
        type:       type,
        text:       text,
      ).run
    end
  end
end
