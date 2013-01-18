class Customer < ActiveRecord::Base  
  before_validation :ensure_name_has_a_value
  has_attached_file :photo,
  :styles =>{
    :thumb  => "50x50",
    :medium => "200x200",
    :large => "600x400"
   }
  has_one :picture, :as => :imageable
  has_many :products,:through => :customer_visits
  has_many :customer_visits,:dependent => :destroy
  validates :first_name, :presence => true, :length => { :maximum => 100 }     
  validates :phoneno,:address, :presence => true,:uniqueness=>true
  validates :email,:presence => true,:uniqueness=>true,:confirmation => true,:format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }   
  #validates :terms_of_service, :acceptance => {:accept => true }
  
  protected
  def ensure_name_has_a_value
    if first_name.empty? and last_name.empty?      
      self.first_name = email unless email.blank?
    end
  end
  
end
