# frozen_string_literal: true

class MailFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless value && value !~ Settings.email_format
    record.errors[attribute] << (options[:message] || I18n.t('validators.format'))
  end
end
