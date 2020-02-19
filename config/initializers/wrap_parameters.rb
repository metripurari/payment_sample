# Be sure to restart your server when you modify this file.

# This file contains settings for ActionController::ParamsWrapper which
# is enabled by default.

# Enable parameter wrapping for JSON. You can disable this by setting :format to an empty array.
ActiveSupport.on_load(:action_controller) do
  wrap_parameters format: [:json]
end

# To enable root element in JSON for ActiveRecord objects.
# ActiveSupport.on_load(:active_record) do
#   self.include_root_in_json = true
# end


# require "reform/form/active_model/validations"

# Reform::Form.class_eval do
#   include Reform::Form::ActiveModel::Validations
# end

# Ra/\ils.application.config.reform.validations = :dry