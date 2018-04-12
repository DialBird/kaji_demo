# frozen_string_literal: true

class TimeBlock < ActiveYaml::Base
  include ActiveHash::Enum

  set_root_path 'config/master'
  set_filename name.underscore
end
