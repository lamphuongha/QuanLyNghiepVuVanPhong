class Chitietdiemrenluyen < ActiveRecord::Base
  belongs_to :sinhvien
  belongs_to :diemrenluyen
  
  attr_accessor :enable
end
