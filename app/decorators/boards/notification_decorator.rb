# frozen_string_literal: true

require "delegate"

module Boards
  class NotificationDecorator < SimpleDelegator
    def notification
      __getobj__
    end

    def css_class
      types_classes = {
        sucess:  "alert alert-sucess",
        ok:      "alert alert-sucess",
        danger:  "alert alert-danger",
        error:   "alert alert-danger",
        info:    "alert alert-info",
        warning: "alert alert-warning"
      }

      (types_classes[notification.type.to_sym] || notification.type).to_s
    end
  end
end
