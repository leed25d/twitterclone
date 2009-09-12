class LandingController < ApplicationController
  def index
    if session[:user_id]
      @tweets= Tweet.find(:all, :conditions => "user_id = #{session[:user_id]}", :order => "updated_at DESC", :limit => 20);
    end
    respond_to do |format|
      format.html
    end
  end
end
