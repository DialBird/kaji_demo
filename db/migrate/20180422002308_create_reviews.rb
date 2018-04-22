class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id, null: false, comment: 'ユーザーID'
      t.integer :clean_order_id, null: false, comment: '清掃オーダーID'
      t.date :date, comment: 'コメント日付'
      t.integer :star, null: false, default: 0, comment: 'スター'
      t.text :comment, comment: 'コメント'

      t.timestamps
    end
    add_foreign_key :reviews, :users, name: 'reviews_user_id_fk'
    add_foreign_key :reviews, :clean_orders, name: 'reviews_clean_order_id_fk'
  end
end
