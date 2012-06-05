class Nguoilienquan < ActiveRecord::Base
  belongs_to :congvan
  belongs_to :giangvien
end
