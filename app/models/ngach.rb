class Ngach < ActiveRecord::Base
    has_many :giangviens
validates_presence_of :MaNgach, :TenNgach , :message => "không được trống"
validates_uniqueness_of :MaNgach, :message => "đã tồn tại"
end
