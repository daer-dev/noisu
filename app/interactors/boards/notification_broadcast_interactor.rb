# frozen_string_literal: true

module Boards
  class NotificationBroadcastService
    attr_accessor :board_slug,
                  :type,
                  :text

    def initialize(board_slug:, type:, text:)
      @board_slug = board_slug
      @type       = type
      @text       = text
    end

    def run
      self.broadcast
    end

    protected

      def broadcast
        board = Board.friendly.find(self.board_slug)

        BoardsNotificationsChannel.broadcast_to(board.broadcast, html: self.notification_html)
      end

      def notification_html
        notification_decorator = Boards::NotificationDecorator.new(self)

        ApplicationController.renderer.new.render 'boards/notifications/notification', notification: notification_decorator
      end
  end
end
