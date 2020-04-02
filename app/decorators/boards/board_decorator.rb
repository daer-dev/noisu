# frozen_string_literal: true

require "delegate"

module Boards
  class BoardDecorator < SimpleDelegator
    def board
      __getobj__
    end

    def broadcast
      board.broadcast.to_a.join(" ")
    end
  end
end
