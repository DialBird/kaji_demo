# frozen_string_literal: true

class Dayofweek < ActiveYaml::Base
  include ActiveHash::Enum

  set_root_path 'config/master'
  set_filename name.underscore

  enum_accessor :type
end
