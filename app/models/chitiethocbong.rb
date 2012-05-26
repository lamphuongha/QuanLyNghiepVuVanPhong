class Chitiethocbong < ActiveRecord::Base
  belongs_to :sinhvien
  belongs_to :hocbong
  cattr_reader :per_page
  @@per_page = 20
end
