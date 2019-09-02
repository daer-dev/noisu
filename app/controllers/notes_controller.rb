# frozen_string_literal: true

class NotesController < ApplicationController
  def index
    @notes = Note.where(board_slug: params[:board_slug]).all
  end

  def new
    @note = Note.new
  end

  def create
    create_service = Notes::CreateService.new(
      record_attrs: allowed_params,
      board_slug:   params[:board_slug]
    )

    if create_service.run
      flash[:success] = create_service.message
    else
      flash[:error] = create_service.message

      @note = create_service.record

      redirect_to boards_path(params[:board_slug])
    end
  end

  private

    def allowed_params
      params.require(:note).permit(
        :content
      )
    end
end
