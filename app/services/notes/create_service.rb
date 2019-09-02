module Notes
  class CreateService
    attr_reader :record_attrs,
                :board_slug

    attr_accessor :status,
                  :message,
                  :record

    def initialize(record_attrs:, board_slug:)
      @record_attrs = record_attrs
      @board_slug   = board_slug
    end

    def run
      result = self.persist && self.broadcast

      self.set_status(result)

      result
    end

    protected

      def persist
        note_board = Board.friendly.find(self.board_slug)
        self.record = Note.new(record_attrs.merge(board: note_board))

        self.record.save
      end

      def broadcast
        BoardsChannel.broadcast_to(record.board.broadcast, content: record.content)
      end

      def set_status(result)
        if result
          self.status  = :ok
          self.message = I18n.t('notes.create.messages.success')
        else
          self.status  = :error
          self.message = I18n.t('notes.create.messages.error')
        end
      end
  end
end
