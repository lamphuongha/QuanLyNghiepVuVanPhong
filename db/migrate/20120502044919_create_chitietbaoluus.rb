class CreateChitietbaoluus < ActiveRecord::Migration
  def self.up
    create_table :chitietbaoluus do |t|
      t.column 'sinhvien_id', :string
      t.column 'baoluu_id', :string
    end
  end
  def self.down
    drop_table :chitietbaoluus
  end
end
