# frozen_string_literal: true

module Boards
  class NoteValidationService
    attr_accessor :record_attrs

    attr_reader :record

    def initialize(record_attrs:)
      @record_attrs = record_attrs
    end

    def run
      self.validate
    end

    protected

      def validate
        true
      end
  end
end
