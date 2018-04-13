# frozen_string_literal: true

class StaffDecorator < Draper::Decorator
  delegate_all

  def regular_shifts_json
    # shifts should be listed from Sunday to Saturday
    regular_shifts
      .order(:dayofweek_id)
      .map do |rs|
        {
          start: ShiftTime.find(rs.start_at).time,
          end: ShiftTime.find(rs.end_at).time
        }
      end
  end

  def irregular_offs_json
    irregular_offs
      .map do |io|
        {
          date: io.date,
          start: ShiftTime.find(io.start_at).time,
          end: ShiftTime.find(io.end_at).time
        }
      end
  end
end
