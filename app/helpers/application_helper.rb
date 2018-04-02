# frozen_string_literal: true

module ApplicationHelper
  def display_flash
    flash.each do |type, msg|
      concat content_tag(:div, msg, class: "alert alert-#{type}")
    end
    nil
  end
end
