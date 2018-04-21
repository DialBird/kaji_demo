# frozen_string_literal: true

class CreateCleanOrderService
  attr_reader :clean_order

  def initialize(clean_order)
    @clean_order = clean_order
  end

  def execute
    ActiveRecord::Base.transaction do
      clean_order.clean_spots_attributes = clean_spot_params
      clean_order.save!
    end
    true
  rescue ActiveRecord::RecordInvalid
    false
  end

  private

  def clean_spot_params
    clean_order.spots.map { |spot_id| { spot_id: spot_id } }
  end
end
