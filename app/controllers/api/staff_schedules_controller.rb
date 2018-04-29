# frozen_string_literal: true

class Api::StaffSchedulesController < ApplicationController
  def info
    respond_to do |format|
      format.json { render json: events_json(params[:staff_id]) }
    end
  end

  private

  def events_json(staff_id)
    clean_orders_json(staff_id).concat irregular_offs_json(staff_id)
  end

  def clean_orders_json(staff_id)
    clean_orders = CleanOrder.where(date: params[:dates], staff_id: staff_id)
    json_format(clean_orders)
  end

  def irregular_offs_json(staff_id)
    irregular_offs = IrregularOff.where(date: params[:dates], staff_id: staff_id)
    json_format(irregular_offs)
  end

  def json_format(items)
    items.map do |item|
      {
        id: item.id,
        date: item.date,
        type: item.class.name,
        start: ShiftTime.find(item.start_at).time,
        end: ShiftTime.find(item.end_at).time
      }
    end
  end
end
