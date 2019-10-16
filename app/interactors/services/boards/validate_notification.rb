# frozen_string_literal: true

module Services
  module Boards
    class ValidateNotification
      include Interactor

      before :check_needed_params!

      def call
        notification_validator = ::Boards::NotificationValidator.new(context.notification_attrs)

        unless notification_validator.valid?
          context.errors = notification_validator.errors

          context.fail!
        end
      end

      protected

        def check_needed_params!
          context.fail! if context.notification_attrs.blank?
        end
    end
  end
end
