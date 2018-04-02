# frozen_string_literal: true

class PhoneFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # 参考にした正規表現: https://github.com/sakatam/a-better-jp-phone-regex
    return unless value && value !~ /\A(0([1-9]{1}-?[1-9]\d{3}|[1-9]{2}-?\d{3}|[1-9]{2}\d{1}-?\d{2}|[1-9]{2}\d{2}-?\d{1})-?\d{4}|0[789]0-?\d{4}-?\d{4}|050-?\d{4}-?\d{4})\z/
    record.errors[attribute] << (options[:message] || I18n.t('validators.format'))
  end
end
