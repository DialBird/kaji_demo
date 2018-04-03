# frozen_string_literal: true

class PhoneFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless value && value !~ Settings.phone_format
    record.errors[attribute] << (options[:message] || I18n.t('validators.format'))
  end
end
