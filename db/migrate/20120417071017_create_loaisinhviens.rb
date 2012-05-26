class CreateLoaisinhviens < ActiveRecord::Migration
  def change
    create_table :loaisinhviens do |t|
      t.column 'MaLoaiSv', :string
      t.column 'TenLoaiSv', :string
    end
  end
    def self.down
    drop_table :loaisinhviens
  end
end
