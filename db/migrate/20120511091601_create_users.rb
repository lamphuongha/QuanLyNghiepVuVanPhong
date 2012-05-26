class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.integer :giangvien_id
      t.integer :role_id, :default => 3
    end
  end
  def self.down
    drop_table :users
  end
end
