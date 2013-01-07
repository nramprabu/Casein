class CustomerVisit < ActiveRecord::Base
	belongs_to :product 
	belongs_to :customer
	validates :customer_id,:product_id,:serial_no,:issue_type, :presence => true	
end
