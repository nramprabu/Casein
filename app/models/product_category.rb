class ProductCategory < ActiveRecord::Base
  has_many :products
  validates :name, :presence => true, :length => { :maximum => 100 } , :uniqueness=> true
end