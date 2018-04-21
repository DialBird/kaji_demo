# frozen_string_literal: true

class Api::StaffSchedulesController < ApplicationController
  def info
    staff_id = params[:staff_id]
    clean_orders = CleanOrder.where(date: params[:dates], staff_id: staff_id)
    clean_orders_json = json_format(clean_orders)
    irregular_offs = IrregularOff.where(date: params[:dates], staff_id: staff_id)
    irregular_offs_json = json_format(irregular_offs)
    json = clean_orders_json.concat irregular_offs_json
    respond_to do |format|
      format.json { render json: json }
    end
  end

  private

  def json_format(items)
    items.map do |io|
      {
        id: io.id,
        date: io.date,
        start: ShiftTime.find(io.start_at).time,
        end: ShiftTime.find(io.end_at).time
      }
    end
  end
end
