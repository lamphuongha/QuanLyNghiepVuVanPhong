class CreateChucvus < ActiveRecord::Migration
  def change
    create_table :chucvus do |t|
      t.column 'MaCV', :string
      t.column 'TenCV', :string
    end
  end
   def self.down
    drop_table :chucvus
  end
end
