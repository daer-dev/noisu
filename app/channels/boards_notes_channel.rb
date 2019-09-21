# frozen_string_literal: true

class BoardsNotesChannel < ApplicationCable::Channel
  def subscribed
    stream_from params[:broadcast]
  end
end
