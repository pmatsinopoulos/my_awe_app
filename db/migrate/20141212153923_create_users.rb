class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,           null: false
      t.string :password_digest, null: false
      t.string :name,            null: true

      t.timestamps
    end

    add_index :users, [:email], unique: true, name: 'create_users_email_uidx'
    add_index :users, [:name],                name: 'create_users_name_idx'
  end
end
