# frozen_string_literal: true

module TimeHelper
  def start_time(obj)
    ShiftTime.find(obj.start_at).time
  end

  def end_time(obj)
    ShiftTime.find(obj.end_at).time
  end
end
