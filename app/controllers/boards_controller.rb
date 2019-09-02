# frozen_string_literal: true

class BoardsController < ApplicationController
  before_action :set_new_note

  def index
    @boards = Board.all
  end

  def show
    @board = Board.friendly.find(params[:slug])
  end

  private

    def set_new_note
      @note = Note.new
    end
end
