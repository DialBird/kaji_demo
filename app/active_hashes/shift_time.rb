# frozen_string_literal: true

class ShiftTime < ActiveYaml::Base
  include ActiveHash::Enum

  set_root_path 'config/master'
  set_filename name.underscore

  enum_accessor :type

  class << self
    def selectable_options
      all.reject { |item| item.time == '00:00' }
    end
  end
end
