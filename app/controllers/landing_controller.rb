class LandingController < ApplicationController
   def index  
     @users = User.all()  
     respond_to do |format|  
       format.html  
     end  
   end  
end
