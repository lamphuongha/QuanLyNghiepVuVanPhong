class Asset < ActiveRecord::Base
  belongs_to :congvan
  
  has_attached_file :image 
end
