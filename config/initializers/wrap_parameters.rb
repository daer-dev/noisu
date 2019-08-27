# frozen_string_literal: true

# This file contains settings for ActionController::ParamsWrapper, which is enabled by default.

# Enable parameter wrapping for JSON.
ActiveSupport.on_load(:action_controller) do
  wrap_parameters format: [ :json ]
end
