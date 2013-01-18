class Article < ActiveRecord::Base
  has_many :comments, :as => :commentable,:dependent=>:destroy
  validates :description, :presence => true, :length => { :maximum => 100 } 
  validates :name, :uniqueness => true, :allow_blank => true

  #~ after_update :find_article
  
  #~ private
  #~ def find_article
    #~ @articles = Article.paginate(:page => params[:page], :per_page=> APP_CONFIG['Pagination']['per_page'], :order => 'created_at ASC') 
  #~ end
  
end
