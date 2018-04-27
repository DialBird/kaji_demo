# frozen_string_literal: true

module LabelHelper
  def render_label(type, &block)
    content_tag :span, class: "badge badge-#{type}", &block
  end

  def gender_label(gender)
    case gender
    when Gender::MAN
      render_label('primary') do
        fa_icon 'mars'
      end
    when Gender::WOMAN
      render_label('danger') do
        fa_icon 'venus'
      end
    when Gender::OTHER
      render_label('success') do
        fa_icon 'transgender'
      end
    end
  end

  def order_status_label(order)
    case order.order_status
    when OrderStatus::CHECKING
      concat render_label('default') { 'checking' }
      concat render_label(:warning) { 'response waiting' } if order.staff_waiting?
      nil
    when OrderStatus::ACCEPTED
      render_label('warning') { 'accepted' }
    when OrderStatus::COMPLETED
      render_label('success') { 'completed' }
    when OrderStatus::CANCELED
      render_label('danger') { 'canceled' }
    end
  end
end
