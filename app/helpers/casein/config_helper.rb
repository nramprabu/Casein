module Casein
  module ConfigHelper
    
  	# Text string containing the name of the website or client
  	# Used in text and titles throughout Casein
    
    def casein_find_user_comment(user)
     @user=ActiveRecord::Base.connection.execute("select * from casein_users where `id`= #{user}")
     @user=@user.fetch_hash
     return @user["name"]
    end
    
    def fullname(fname,lname)
      "#{fname}" + "#{lname}"
    end
    def casein_config_website_name
    	'Casein'
    end

    def paginate_range(in_collection, in_tot_count)
      endnumber = in_collection.offset + in_collection.per_page > in_tot_count ?
        in_tot_count : in_collection.offset + in_collection.per_page
      "Displaying records #{in_collection.offset + 1} - #{endnumber} of #{in_tot_count}"
    end
   
  	# URL to the logo used for the login screen and top banner - it should be a transparent PNG
    def casein_config_logo
    	'/casein/images/dell.jpg'
    end

  	# The server hostname where Casein will run
    def casein_config_hostname
      if ENV['RAILS_ENV'] == 'production'
        'http://www.caseincms.com'
      else
        'http://localhost:3000'
      end
    end

  	# The sender email address used for notifications
  	def casein_config_email_from_address
  		'donotreply@caseincms.com'
  	end
	
  	# The page that the user is shown when they login or click the logo
  	# do not point this at casein/index!
  	def casein_config_dashboard_url
  		url_for :controller => :casein, :action => :blank
  	end
	
  	# A list of stylesheet files to include in the page head section
  	def casein_config_stylesheet_includes
  		%w[/casein/stylesheets/custom /casein/stylesheets/screen /casein/stylesheets/elements /casein/stylesheets/lightbox /casein/stylesheets/calender /casein/stylesheets/datepicker]
  	end
	
  	# A list of JavaScript files to include in the page head section
  	def casein_config_javascript_includes
  	  %w[/casein/javascripts/jquery /casein/javascripts/custom /casein/javascripts/casein /casein/javascripts/rails /casein/javascripts/lightbox /casein/javascripts/jquery.datePicker /casein/javascripts/date /casein/javascripts/jquery.lightbox_me.js /casein/javascripts/fb_all.js]
  	end
  	
  end
end