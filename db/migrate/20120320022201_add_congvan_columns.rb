class AddCongvanColumns < ActiveRecord::Migration
  def self.up
    add_column "congvans", :image_file_name,:string
    add_column "congvans", :image_content_type,:string
    add_column "congvans", :image_file_size,:integer
  end

  def self.down
    remove_column "congvans", :image_file_name
    remove_column "congvans", :image_content_type
    remove_column "congvans", :image_file_size

  end
end
