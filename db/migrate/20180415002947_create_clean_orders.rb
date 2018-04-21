class CreateCleanOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :clean_orders, comment: '清掃オーダー' do |t|
      t.integer :user_id, null: false, comment: 'ユーザーID'
      t.integer :staff_id, comment: 'スタッフID'
      t.integer :clean_plan_id, null: false, default: 2, comment: '清掃プラン（clean_plan.yml参照）'
      t.integer :order_status_id, null: false, default: 1, comment: 'オーダーステータス（order_status.yml参照）'
      t.date :date, null: false, comment: '日付'
      t.integer :start_at, null: false, comment: '開始時間（time_block.yml参照）'
      t.integer :end_at, null: false, comment: '終了時間（time_block.yml参照）'
      t.text :note, comment: '備考'

      t.timestamps
    end
  end
end
