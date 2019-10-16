# frozen_string_literal: true

require 'ostruct'

module Services
  module Boards
    class BroadcastNotification
      include Interactor

      before :check_needed_params!

      def call
        context.fail! unless self.broadcast!
      end

      protected

        def check_needed_params!
          context.fail! if context.board_slug.blank? ||
                           context.notification_attrs.blank?
        end

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
