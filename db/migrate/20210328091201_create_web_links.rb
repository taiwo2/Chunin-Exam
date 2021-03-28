class CreateWebLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :web_links do |t|
      t.string :uid, null: false, default: ""
      t.string :original_url, null: false, default: ""
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :web_links, :uid, unique: true
  end
end
