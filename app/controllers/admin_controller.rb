class AdminController < ApplicationController
  def login
  	if request.post?
	  	  	 if params[:email]=="sowjimadhupada@gmail.com" && params[:password]=="Sowji@123"
	  	  	 	session[:admin]="admin"
	  	  	 	flash[:notice]="you logged in"
	  	  	 	redirect_to stores_path
	  	  	 else 
	  	  	 	flash[:notice]="Invalid input"
	  	  	 	redirect_to :action=>:login
	  	  	 end
	end
  end
   def logout
	  	  session[:admin]=nil
	  	  flash[:notice]="you logged out"
	  	  redirect_to :action=>:login
	  end
end
