# frozen_string_literal: true

class BoardsNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from params[:broadcast]
  end
end
