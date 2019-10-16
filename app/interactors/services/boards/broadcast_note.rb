# frozen_string_literal: true

module Services
  module Boards
    class BroadcastNote
      include Interactor

      before :check_needed_params!

      def call
        if self.broadcast!
          ::Boards::NotificationCreationJob.perform_later(
            board_slug:         context.board_slug,
            notification_attrs: {
              type: :success,
              text: I18n.t('notes.create.messages.success')
            }
          )
        else
          ::Boards::NotificationCreationJob.perform_later(
            board_slug:         context.board_slug,
            notification_attrs: {
              type: :error,
              text: I18n.t('notes.create.messages.error')
            }
          )

          context.fail!
        end
      end

      protected

        def check_needed_params!
          context.fail! if context.board_slug.blank? ||
                           context.note.blank?
        end

        def broadcast!
          BoardsNotesChannel.broadcast_to(context.note.board.broadcast, html: self.note_html)
        end

        def note_html
          note_decorator = ::Boards::NoteDecorator.new(context.note)

          ApplicationController.renderer.new.render 'notes/_note',
            layout: false,
            locals: { note_decorator: note_decorator }
        end
    end
  end
end
