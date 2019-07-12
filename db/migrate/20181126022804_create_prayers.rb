class CreatePrayers < ActiveRecord::Migration[5.2]
  def change
    create_table :prayers do |t|
      t.integer :user_id
      t.datetime :prayer_at
      t.string :note
      t.boolean :status, default: true

      t.timestamps null: false
    end

    add_index :prayers, :user_id, unique: false
  end
end
