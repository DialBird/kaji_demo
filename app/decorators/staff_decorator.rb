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
end
