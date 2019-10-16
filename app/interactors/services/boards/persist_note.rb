# frozen_string_literal: true

module Services
  module Boards
    class PersistNote
      include Interactor

      before :check_needed_params!

      def call
        context.board = Board.friendly.find(context.board_slug)

        context.note  = Note.new(context.note_attrs.merge(board: context.board))

        context.fail! unless context.note.save
      end

      def rollback
        context.note.destroy if context.note.present? && context.note.persisted?
      end

      protected

        def check_needed_params!
          context.fail! if context.board_slug.blank? ||
                           context.note_attrs.blank?
        end
    end
  end
end
