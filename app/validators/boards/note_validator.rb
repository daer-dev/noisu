# frozen_string_literal: true

require 'ostruct'

module Boards
  class NoteValidator < OpenStruct
    include ActiveModel::Validations

    validates :content, presence: true
  end
end
