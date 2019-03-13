# frozen_string_literal: true

class BoardsChannel < ApplicationCable::Channel
  def subscribed
    @boards.each do |board|
      stream_from "board_#{board.id}"
    end
  end
end
