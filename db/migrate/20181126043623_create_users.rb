class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :prayer_count
      t.integer :not_prayer_count

      t.timestamps
    end

    execute <<-SQL
      CREATE UNIQUE INDEX users_lower_username_idx ON users (LOWER(username));
      CREATE UNIQUE INDEX users_lower_email_idx ON users (LOWER(email));
    SQL
  end
end
