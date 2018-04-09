# frozen_string_literal: true

class ShiftTime < ActiveYaml::Base
  include ActiveHash::Enum

  set_root_path 'config/master'
  set_filename name.underscore

  enum_accessor :type
end
