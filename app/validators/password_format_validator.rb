# frozen_string_literal: true

class PasswordFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank? || value =~ Settings.password_format
    record.errors[attribute] << (options[:message] || I18n.t('errors.messages.invalid_password'))
  end
end
