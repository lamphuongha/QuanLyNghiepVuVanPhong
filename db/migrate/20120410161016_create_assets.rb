class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.references :congvan
      
    end
  end
end
