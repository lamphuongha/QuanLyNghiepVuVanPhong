class CreateTrinhdodaotaos < ActiveRecord::Migration
  def self.up
    create_table :trinhdodaotaos do |t|
      t.column 'MaTDDT', :string
      t.column 'TenTDDT', :string
      
    end
  end
  def self.down
    drop_table :trinhdodaotaos
  end
end
