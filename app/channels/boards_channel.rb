# frozen_string_literal: true

class BoardsChannel < ApplicationCable::Channel
  def subscribed
    stream_from params[:broadcast]
  end
end
