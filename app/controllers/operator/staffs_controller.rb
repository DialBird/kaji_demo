# frozen_string_literal: true

class Operator::StaffsController < Operator::ApplicationController
  before_action :setup_staff!, only: %i[show].freeze

  def index
    @staffs = Staff.all
  end

  def show; end

  def new
    @staff = Staff.new
    Dayofweek.all.pluck(:id).each do |id|
      # Default 10:00 ~ 19:00
      @staff.regular_shifts.build(dayofweek_id: id, start_at: 3, end_at: 21)
    end
  end

  def create
    @staff = Staff.new(staff_params)
    if @staff.save
      redirect_to operator_staff_path(@staff), success: t(:create, scope: 'success.messages')
    else
      flash[:danger] = t(:create, scope: 'errors.messages')
      render :new
    end
  end

  private

  def setup_staff!
    @staff = Staff.find(params[:id]).decorate
  end

  def staff_params
    params
      .require(:staff)
      .permit([*Staff::PERMITTED_ATTRIBUTES,
               regular_shifts_attributes: RegularShift::PERMITTED_ATTRIBUTES])
  end
end
