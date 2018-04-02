# frozen_string_literal: true

class ZipFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless value && value !~ /\A[0-9]{7}\z/
    record.errors[attribute] << (options[:message] || I18n.t('validators.format'))
  end
end
