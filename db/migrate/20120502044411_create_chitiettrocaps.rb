class CreateChitiettrocaps < ActiveRecord::Migration
  def self.up
    create_table :chitiettrocaps do |t|
      t.column 'trocap_id', :integer
      t.column 'sinhvien_id', :integer
      
    end
  end
  def self.down
    drop_table :chitiettrocaps
  end
end
