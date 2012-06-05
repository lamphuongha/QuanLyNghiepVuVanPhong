class Loaithuctap < ActiveRecord::Base
  has_many :thongtinthuctaps
  has_many :sinhviens
end
