# frozen_string_literal: true

class NotesController < ApplicationController
  def index
    @notes = Note.where(board_id: params[:board_id]).all
  end

  def new
  end

  def create
    @note = Note.new(allowed_params)

    if @note.save
      BoardsChannel.broadcast_to(broadcast_rooms,
        text: params[:note][:text]
      )
    else
      redirect_to boards_path(params[:board_id])
    end
  end

  private

    def allowed_params
      params.require(:note).permit(
        :text
      )
    end
end
