# frozen_string_literal: true

class User::ReviewsController < User::ApplicationController
  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to controller: 'user/clean_orders',
                  action: 'show',
                  id: params[:review][:clean_order_id],
                  success: t(:review_send, scope: 'success.message')
    else
      redirect_to controller: 'user/clean_orders',
                  action: 'show',
                  id: params[:review][:clean_order_id],
                  danger: t(:review_send, scope: 'errors.message')
    end
  end

  def edit; end

  def update; end

  private

  def review_params
    params.require(:review).permit(Review::PERMITTED_ATTRIBUTES)
  end
end
