# frozen_string_literal: true

module Boards
  class ValidateNotification
    include Interactor
    include ActiveModel::Validations

    validates :type, presence:  true,
                     inclusion: { in: [ :sucess, :error, :info, :warning ] }

    validates :text, presence: true

    def initialize(notification_attrs)
      @type = notification_attrs[:type]
      @text = notification_attrs[:text]
    end

    def call
      context.fail! unless self.new(context.notification_attrs.symbolize).valid?
    end
  end
end
