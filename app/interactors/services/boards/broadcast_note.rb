# frozen_string_literal: true

module Services
  module Boards
    class BroadcastNote
      include Interactor

      def call
        if self.broadcast!
          Boards::NotificationCreationJob.perform_later(
            board_slug: context.board_slug,
            type:       :success,
            text:       I18n.t('notes.create.messages.success')
          )
        else
          Boards::NotificationCreationJob.perform_later(
            board_slug: context.board_slug,
            type:       :error,
            text:       I18n.t('notes.create.messages.error')
          )

          context.fail!
        end
      end

      protected

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
