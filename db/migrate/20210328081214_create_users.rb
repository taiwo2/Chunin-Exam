class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email_address, null: false, default: ""
      t.string :password_digest, null: false, default: ""
      t.string :auth_token, null: false, default: ""
      t.integer :web_links_count, null: false, default: 0

      t.timestamps
    end

    add_index :users, :email_address, unique: true
    add_index :users, :auth_token, unique: true
  end
end
