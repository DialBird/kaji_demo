# frozen_string_literal: true

module LabelHelper
  def render_label(type)
    content_tag :span, class: "label label-#{type}" do
      yield
    end
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
      render_label('default') { 'checking' }
    when OrderStatus::ACCEPTED
      render_label('warning') { 'accepted' }
    when OrderStatus::COMPLETED
      render_label('success') { 'completed' }
    when OrderStatus::CANCELED
      render_label('danger') { 'canceled' }
    end
  end
end
