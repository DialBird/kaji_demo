class CreateCleanSpots < ActiveRecord::Migration[5.1]
  def change
    create_table :clean_spots, comment: '清掃箇所' do |t|
      t.integer :clean_order_id, null: false, comment: '清掃オーダーID'
      t.integer :clean_spot_id, null: false, comment: '清掃スポットID'

      t.timestamps
    end
    add_foreign_key :clean_spots, :clean_orders, name: 'clean_spots_clean_order_id_fk'
  end
end
