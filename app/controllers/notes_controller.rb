# frozen_string_literal: true

class NotesController < ApplicationController
  def index
    @notes = Note.where(board_slug: params[:board_slug]).all
  end

  def new
    @note = Note.new
  end

  def create
    if Boards::NoteCreationJob.perform_later(
        board_slug: params[:board_slug],
        note_attrs: allowed_params
      )

      Boards::NotificationCreationJob.perform_later(
        board_slug: params[:board_slug],
        type:       :info,
        text:       I18n.t('notes.create.messages.pending')
      )
    else
      Boards::NotificationCreationJob.perform_later(
        board_slug: params[:board_slug],
        type:       :error,
        text:       I18n.t('notes.create.messages.error')
      )

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
