# frozen_string_literal: true

class StaffDecorator < Draper::Decorator
  delegate_all

  def regular_shifts_json
    # shifts should be listed from Sunday to Saturday
    regular_shifts
      .order(:dayofweek_id)
      .map do |rs|
        {
          start: TimeBlock.find(rs.start_at).time,
          end: TimeBlock.find(rs.end_at).time
        }
      end
  end

  def irregular_offs_json
    irregular_offs.to_json(only: %i[date start end].freeze)
  end
end
