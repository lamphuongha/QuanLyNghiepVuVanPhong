class Lop < ActiveRecord::Base
  #has_and_belongs_to_many :giangviens
  has_many :sinhviens
  has_many :covanhoctaps
  has_many :giangviens, :through => :covanhoctaps
end
