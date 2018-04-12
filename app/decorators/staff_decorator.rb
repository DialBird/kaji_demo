# frozen_string_literal: true

class StaffDecorator < Draper::Decorator
  delegate_all

  def irregular_offs_json
    irregular_offs.to_json(only: %i[date start end].freeze)
  end
end
