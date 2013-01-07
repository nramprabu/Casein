class Customer < ActiveRecord::Base
  has_attached_file :photo,
  :styles =>{
    :thumb  => "50x50",
    :medium => "200x200",
    :large => "600x400"
   }
  has_one :picture, :as => :imageable
  has_many :products,:through => :customer_visits
  has_many :customer_visits,:dependent => :destroy
  validates :first_name,:last_name, :presence => true, :length => { :maximum => 100 }   
  validates :phoneno,:address, :presence => true,:uniqueness=>true
  validates :email,:presence => true,:uniqueness=>true,:format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }   
end
