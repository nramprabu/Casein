module Casein
class FacebookController < Casein::CaseinController
	def login_page
		
	end
	
	def facebook_login_start		
		redirect_to client.authorization.authorize_url(:redirect_uri=>"http://localhost:3000#{facebook_show_casein_facebook_index_path}/",:scope=>'email')
	end	
	
	 def facebook_show
		 access_token=client.authorization.process_callback(params[:code],:redirect_uri=>"http://localhost:3000#{facebook_show_casein_facebook_index_path}/")
		 session[:access_token]=access_token
		 fb_friends=client.selection.me.friends.info!.data.to_json
		 user = client.selection.me.info!		 
		 parse_fb_friends = JSON.parse(fb_friends)		
     @parse_data=parse_fb_friends["data"]
		 #~ render :json=> @fb_friends #command to view all user friends list
	 end
	 
	 def new
		 
	 end
	 
	 def twitter_tweets			
		begin
		# Initialize your Twitter client
			client = Twitter::Client.new	
			@tweets=client.update(params[:tweet_comment])		
			flash[:notice] = "Twitter successfully posted."
			redirect_to login_page_casein_facebook_index_path
		rescue Exception => e
			@error_message = e.message
			render :action=>"new"
		end
	 end
	 
	private

	def client 
		@client ||= FBGraph::Client.new(:client_id => '139189009564249', :secret_id => 'b5656b8abc08fa63d10350d29cff9b44')
	end
	
end	
end
