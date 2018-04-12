class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, comment: 'ユーザー' do |t|
      t.integer :gender_id, null: false, comment: '性別(gender.yml参照)'
      t.integer :age, null: false, comment: '年齢'
      t.string :avatar, comment: 'プロファイル画像'
      t.string :name, null: false, comment: '名前'
      t.date :birthday, comment: '誕生日'
      t.string :email, null: false, comment: 'メール'
      t.string :phone, null: false, comment: '電話番号'
      t.string :zip, comment: '郵便番号'
      t.string :state, comment: '都道府県'
      t.string :city, comment: '市区町村'
      t.string :street, comment: '番地'
      t.string :password_digest
      t.string :remember_digest

      t.timestamps
    end
    add_index :users, :name, unique: true
    add_index :users, :email, unique: true
  end
end
