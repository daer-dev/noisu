# frozen_string_literal: true

require 'ostruct'

module Boards
  class NotificationValidator < OpenStruct
    include ActiveModel::Validations

    validates :type, presence:  true,
                     inclusion: { in: [ :sucess, :error, :info, :warning ] }

    validates :text, presence: true
  end
end
