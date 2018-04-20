# frozen_string_literal: true

class CleanOrderDecorator < Draper::Decorator
  delegate_all

  def clean_spot_images
    clean_spots.each do |clean_spot|
      h.concat h.image_tag "spots/#{clean_spot.spot.type}.png", size: '50x50', style: 'display: inline-block; margin-right: 25px;'
    end
    nil
  end
end
