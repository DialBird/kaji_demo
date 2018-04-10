class CreateIrregularOffs < ActiveRecord::Migration[5.1]
  def change
    create_table :irregular_offs, comment: '急な休み' do |t|
      t.integer :staff_id, null: false, comment: 'スタッフID'
      t.datetime :date, null: false, comment: '日付'
      t.string :start, null: false, comment: '開始時間'
      t.string :end, null: false, comment: '終了時間'

      t.timestamps
    end
    add_foreign_key :irregular_offs, :staffs, column: :staff_id, name: 'irregular_offs_staff_id_fk'
  end
end
