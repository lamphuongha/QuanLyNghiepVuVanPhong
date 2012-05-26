class CreateNgaches < ActiveRecord::Migration
  def change
    create_table :ngaches do |t|
      t.column 'MaNgach', :string
      t.column 'TenNgach', :string
    end
    end
     def self.down
    drop_table :ngaches
  end
end
