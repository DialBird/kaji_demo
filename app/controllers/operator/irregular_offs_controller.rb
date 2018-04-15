# frozen_string_literal: true

class Operator::IrregularOffsController < ApplicationController
  def info
    irregular_offs = IrregularOff.where(date: params[:dates])
    json = json_format(irregular_offs)
    respond_to do |format|
      format.json { render json: json }
    end
  end

  def create
    irregular_off = IrregularOff.new(irregular_off_params)
    respond_to do |format|
      if irregular_off.save
        format.json { render json: irregular_off }
      else
        format.json { render json: irregular_off.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    irregular_off = IrregularOff.find(params[:id])
    respond_to do |format|
      if irregular_off.destroy
        format.json { render json: irregular_off }
      else
        format.json { render json: irregular_off.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def irregular_off_params
    params.require(:irregular_off).permit(IrregularOff::PERMITTED_ATTRIBUTES)
  end

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
