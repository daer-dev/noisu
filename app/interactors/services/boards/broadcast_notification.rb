# frozen_string_literal: true

require 'ostruct'

module Services
  module Boards
    class BroadcastNotification
      include Interactor

      def call
        context.fail! unless self.broadcast!
      end

      protected

        def broadcast!
          board = Board.friendly.find(context.board_slug)

          BoardsNotificationsChannel.broadcast_to(board.broadcast, html: self.notification_html)
        end

        def notification_html
          notification           = OpenStruct.new(context.notification_attrs)
          notification_decorator = ::Boards::NotificationDecorator.new(notification)

          ApplicationController.renderer.new.render 'boards/board/_notification',
            layout: false,
            locals: { notification_decorator: notification_decorator }
        end
    end
  end
end
