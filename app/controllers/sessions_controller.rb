class SessionsController < ApplicationController
  def new
  end


  def create 
  	user = User.authenticate(params[:email], params[:password])
  	if user
      # if user is successfully logged in then return a json file to the ajax
      # and refresh the navbar
      session[:user_id] = user.id
      render :json => {:success => true, :nav_bar_user => render_to_string(:partial => 'layouts/nav_bar_user', :locals => {:current_user => current_user}) }	
  	# 	redirect_to root_url, :notice => "Logged in!"
  	else
      render :json => "Unknown username or password", :status => :unprocessable_entity
  		
  		# render "new"
  	end
  end

  def destroy
  	session.delete(:user_id)
  	redirect_to root_url, :notice => "Logged out!"
  end

end
