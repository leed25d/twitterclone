class LandingController < ApplicationController
  def index
    if session[:user_id]
      @tweets= Tweet.find(:all, :conditions => "user_id = #{session[:user_id]}", :order => "updated_at DESC", :limit => 20);
      @user= User.find(:first, :conditions => "id = #{session[:user_id]}");
      @users= User.find_by_sql(["select * from users where users.id NOT IN (select f.other_id from follows f where f.user_id= ?) AND users.id != ?", session[:user_id], session[:user_id]]);
    end
    respond_to do |format|
      format.html
    end
  end
end
