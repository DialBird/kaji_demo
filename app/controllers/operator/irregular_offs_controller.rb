# frozen_string_literal: true

class Operator::IrregularOffsController < Operator::ApplicationController
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
end
