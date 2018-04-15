class CreateIrregularOffs < ActiveRecord::Migration[5.1]
  def change
    create_table :irregular_offs, comment: '急な休み' do |t|
      t.integer :staff_id, null: false, comment: 'スタッフID'
      t.date :date, null: false, comment: '日付'
      t.integer :start_at, null: false, comment: '開始時間（time_block.yml参照）'
      t.integer :end_at, null: false, comment: '終了時間（time_block.yml参照）'

      t.timestamps
    end
    add_foreign_key :irregular_offs, :staffs, column: :staff_id, name: 'irregular_offs_staff_id_fk'
  end
end
