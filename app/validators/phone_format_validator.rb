# frozen_string_literal: true

class PhoneFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank? || value =~ Settings.phone_format
    record.errors[attribute] << (options[:message] || I18n.t('errors.messages.phone_format'))
  end
end
