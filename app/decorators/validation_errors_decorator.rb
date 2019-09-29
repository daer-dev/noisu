# frozen_string_literal: true

require "delegate"

class ValidationErrorsDecorator < SimpleDelegator
  def validation_errors
    __getobj__
  end

  def full_messages_html
    errors = ""

    validation_errors.full_messages.each do |error_message|
      errors += "<li>#{error_message}</li>"
    end

    if errors.present?
      "<p>#{I18n.t('forms.errors.validation.title')}</p><ul class=\"form-validation-errors\">#{errors}</ul>"
    else
      ""
    end
  end
end
