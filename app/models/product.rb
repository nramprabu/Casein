class Product < ActiveRecord::Base
   has_many :comments, :as => :commentable,:dependent=>:destroy
   has_attached_file :photo,
  :styles =>{
    :thumb  => "50x50",
    :medium => "200x200",
    :large => "600x400"
   }
   has_one :picture, :as => :imageable
   has_many :customers,:through => :customer_visits
   has_many :customer_visits,:dependent => :destroy
   belongs_to :product_category
   validates :name, :presence => true, :length => { :maximum => 100 }   
   validates :name,:years_of_launch,:product_category_id, :presence => true
end