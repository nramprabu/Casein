class Article < ActiveRecord::Base
  has_many :comments, :as => :commentable,:dependent=>:destroy
  #~ after_update :find_article
  
  #~ private
  #~ def find_article
    #~ @articles = Article.paginate(:page => params[:page], :per_page=> APP_CONFIG['Pagination']['per_page'], :order => 'created_at ASC') 
  #~ end
  
end
