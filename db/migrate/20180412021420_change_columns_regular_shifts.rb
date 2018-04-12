class ChangeColumnsRegularShifts < ActiveRecord::Migration[5.1]
  def up
    remove_column :regular_shifts, :mon_start
    remove_column :regular_shifts, :mon_end
    remove_column :regular_shifts, :tue_start
    remove_column :regular_shifts, :tue_end
    remove_column :regular_shifts, :wed_start
    remove_column :regular_shifts, :wed_end
    remove_column :regular_shifts, :thu_start
    remove_column :regular_shifts, :thu_end
    remove_column :regular_shifts, :fri_start
    remove_column :regular_shifts, :fri_end
    remove_column :regular_shifts, :sat_start
    remove_column :regular_shifts, :sat_end
    remove_column :regular_shifts, :sun_start
    remove_column :regular_shifts, :sun_end
    add_column :regular_shifts, :dayofweek_id, :integer, null: false, default: 0, comment: '曜日（day_of_week.yml参照）'
    add_column :regular_shifts, :start, :string, null: false, default: '00:00', comment: '開始時刻（HH:MM）'
    add_column :regular_shifts, :end, :string, null: false, default: '00:00', comment: '終了時刻（HH:MM）'
  end

  def down
    add_column :regular_shifts, :mon_start, :string
    add_column :regular_shifts, :mon_end, :string
    add_column :regular_shifts, :tue_start, :string
    add_column :regular_shifts, :tue_end, :string
    add_column :regular_shifts, :wed_start, :string
    add_column :regular_shifts, :wed_end, :string
    add_column :regular_shifts, :thu_start, :string
    add_column :regular_shifts, :thu_end, :string
    add_column :regular_shifts, :fri_start, :string
    add_column :regular_shifts, :fri_end, :string
    add_column :regular_shifts, :sat_start, :string
    add_column :regular_shifts, :sat_end, :string
    add_column :regular_shifts, :sun_start, :string
    add_column :regular_shifts, :sun_end, :string
    remove_column :regular_shifts, :dayofweek_id
    remove_column :regular_shifts, :start
    remove_column :regular_shifts, :end
  end
end
