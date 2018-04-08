class CreateOperators < ActiveRecord::Migration[5.1]
  def change
    create_table :operators, comment: 'オペレーター' do |t|
      t.boolean :is_admin, null: false, default: false, comment: '管理者権限'
      t.string :name, null: false, comment: '名前'
      t.string :email, null: false, comment: 'メール'
      t.string :phone, null: false, comment: '電話番号'
      t.string :password_digest
      t.string :remember_digest

      t.timestamps
    end
    add_index :operators, :name, unique: true
    add_index :operators, :email, unique: true
  end
end
