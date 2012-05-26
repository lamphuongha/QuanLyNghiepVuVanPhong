class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.column 'MaRole', :string
      t.column 'TenRole', :string
     
    end
  end
  def self.down 
    drop_table :roles
  end
end
