class Loaibuocthoihoc < ActiveRecord::Base
  #has_and_belongs_to_many :sinhviens
  has_many :buocthoihocs
end
