# frozen_string_literal: true

module Services
  module Boards
    class ValidateNote
      include Interactor

      before :check_needed_params!

      def call
        note_validator = ::Boards::NoteValidator.new(context.note_attrs)

        unless note_validator.valid?
          context.errors = note_validator.errors

          self.notify_errors!

          context.fail!
        end
      end

      protected

        def check_needed_params!
          context.fail! if context.note_attrs
        end

        def notify_errors!
          if context.board_slug.present? && context.errors.present?
            ::Boards::NotificationCreationJob.perform_later(
              board_slug:         context.board_slug,
              notification_attrs: {
                type: :error,
                text: ValidationErrorsDecorator.new(context.errors).full_messages_html
              }
            )
          end
        end
    end
  end
end
