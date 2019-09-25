# frozen_string_literal: true

module Boards
  class ValidateNote
    include Interactor
    include ActiveModel::Validations

    validates :content, presence: true

    def initialize(note_attrs)
      @content = note_attrs[:content]
    end

    def call
      context.fail! unless self.new(context.note_attrs.symbolize).valid?
    end
  end
end
