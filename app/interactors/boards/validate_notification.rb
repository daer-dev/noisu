# frozen_string_literal: true

module Boards
  class ValidateNotification
    include Interactor

    def call
      notification_validator = Boards::NotificationValidator.new(context.notification_attrs)

      unless notification_validator.valid?
        context.errors = notification_validator.errors

        context.fail!
      end
    end
  end
end
