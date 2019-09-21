# frozen_string_literal: true

module Boards
  class NotePersistService
    attr_accessor :board_slug,
                  :record_attrs

    attr_reader :record

    def initialize(board_slug:, record_attrs:)
      @board_slug   = board_slug
      @record_attrs = record_attrs
    end

    def run
      self.persist
    end

    protected

      def persist
        board       = Board.friendly.find(self.board_slug)
        self.record = Note.new(record_attrs.merge(board: board))

        self.record.save
      end
  end
end
