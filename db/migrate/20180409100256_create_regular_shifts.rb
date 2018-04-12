class CreateRegularShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :regular_shifts, comment: '通常時のシフト' do |t|
      t.integer :staff_id, null: false, comment: 'スタッフID'
      t.integer :dayofweek_id, null: false, comment: '曜日'
      t.integer :start_at, null: false, comment: '開始時刻（time_block.yml参照）'
      t.integer :end_at, null: false, comment: '終了時刻（time_block.yml参照）'

      t.timestamps
    end
    add_foreign_key :regular_shifts, :staffs, column: :staff_id, name: 'regular_shifts_staff_id_fk'
  end
end
