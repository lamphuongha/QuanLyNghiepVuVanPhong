class CreateTrocaps < ActiveRecord::Migration
  def self.up
    create_table :trocaps do |t|
      t.column 'MaTroCap', :string
      t.column 'TenTroCap', :string
      t.column 'loaitrocap_id', :integer
      t.column 'congvan_id', :integer
      t.column 'HocKy', :integer
      t.column 'NamHoc', :string
      t.column 'GhiChu', :string
    end
  end
  def self.down
    drop_table :trocaps
  end
end
