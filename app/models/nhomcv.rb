class Nhomcv < ActiveRecord::Base
  #has_and_belongs_to_many  :congvans
  has_many :congvans, :through => :congvans_nhomcvs
  has_many :congvans_nhomcvs
  
  
 end
