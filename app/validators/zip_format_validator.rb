# frozen_string_literal: true

class ZipFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank? || value =~ Settings.zip_format
    record.errors[attribute] << (options[:message] || I18n.t('errors.messages.zip_format'))
  end
end
