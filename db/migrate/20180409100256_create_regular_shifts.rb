class CreateRegularShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :regular_shifts, comment: '通常時のシフト' do |t|
      t.integer :staff_id, null: false, comment: 'スタッフID'
      t.string :mon_start, null: false, comment: '月曜日開始'
      t.string :mon_end, null: false, comment: '月曜日終了'
      t.string :tue_start, null: false, comment: '火曜日開始'
      t.string :tue_end, null: false, comment: '火曜日終了'
      t.string :wed_start, null: false, comment: '水曜日開始'
      t.string :wed_end, null: false, comment: '水曜日終了'
      t.string :thu_start, null: false, comment: '木曜日開始'
      t.string :thu_end, null: false, comment: '木曜日終了'
      t.string :fri_start, null: false, comment: '金曜日開始'
      t.string :fri_end, null: false, comment: '金曜日終了'
      t.string :sat_start, null: false, comment: '土曜日開始'
      t.string :sat_end, null: false, comment: '土曜日終了'
      t.string :sun_start, null: false, comment: '日曜日開始'
      t.string :sun_end, null: false, comment: '日曜日終了'

      t.timestamps
    end
    add_foreign_key :regular_shifts, :staffs, column: :staff_id, name: 'regular_shifts_staff_id_fk'
  end
end
