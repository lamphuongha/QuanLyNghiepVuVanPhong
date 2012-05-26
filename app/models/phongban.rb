class Phongban < ActiveRecord::Base
  #has_and_belongs_to_many :congvans
  has_many :congvans, :through => :congvans_phongbans
  has_many :congvans_phongbans
end
