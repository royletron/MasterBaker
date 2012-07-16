class Competition < ActiveRecord::Base
  
  
  validates :name, :presence => true
  validates :startdate, :presence => true
  validates :enddate, :presence => true
end
