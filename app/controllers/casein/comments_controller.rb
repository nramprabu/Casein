# Scaffolding generated by Casein v.3.1.11

module Casein
  class CommentsController < Casein::CaseinController
  
    ## optional filters for defining usage according to Casein::Users access_levels
    # before_filter :needs_admin, :except => [:action1, :action2]
    # before_filter :needs_admin_or_current_user, :only => [:action1, :action2]
  
    def index
      @casein_page_title = 'Comments'
      @commentable = find_commentable
      @comments = @commentable.comments.paginate(:page => params[:page], :per_page=> APP_CONFIG['Pagination']['per_page'], :order => 'created_at ASC') 
    end
  
    def show
      @casein_page_title = 'View comment'
      @comment = Comment.find params[:product_id]
    end
 
    def new
      @casein_page_title = 'Add a new comment'
    	@comment = Comment.new
    end

    def create
      @commentable = find_commentable
      @comment = @commentable.comments.build(params[:comment])
      if @comment.save
      flash[:notice] = "Successfully saved comment."
      redirect_to :id => nil
      else
      render :action => 'new'
      end
    end
  
    def update
      @casein_page_title = 'Update comment'
      
      @comment = Comment.find params[:id]
    
      if @comment.update_attributes params[:comment]
        flash[:notice] = 'Comment has been updated'
        redirect_to casein_comments_path
      else
        flash.now[:warning] = 'There were problems when trying to update this comment'
        render :action => :show
      end
    end
 
    def destroy
      @comment = Comment.find params[:id]

      @comment.destroy
      flash[:notice] = 'Comment has been deleted'
      redirect_to casein_comments_path
    end
  
   private
   
    def find_commentable
      params.each do |name, value|
      if name =~ /(.+)_id$/           
        return $1.classify.constantize.find(value,:include => :comments)
      end
      end
      nil
    end

  end
end