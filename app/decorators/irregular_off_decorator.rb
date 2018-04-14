# frozen_string_literal: true

class IrregularOffDecorator < Draper::Decorator
  delegate_all

  def irregular_offs_json
    irregular_offs
      .map do |io|
        {
          id: io.id,
          date: io.date,
          start: ShiftTime.find(io.start_at).time,
          end: ShiftTime.find(io.end_at).time
        }
      end
  end
end
