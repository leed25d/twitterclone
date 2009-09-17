class LandingController < ApplicationController
##  TODO:   Now here is a realy, really big thing to do.  The two
##  TODO:   'find_by_sql' calls below must be changed to use more railsy
##  TODO:   active record access conventions

  def index
    if session[:user_id]
      @user= User.find(:first, :conditions => "id = #{session[:user_id]}")
      @tweets= Tweet.find_by_sql(["select t.*, u.username from  tweets t,  users u where  (t.user_id= ? OR  t.user_id IN (select f.other_id from follows f where f.user_id= ?)) AND  u.id=t.user_id ORDER BY t.updated_at DESC LIMIT 20", session[:user_id], session[:user_id]])
      @users= User.find_by_sql(["select * from users where users.id NOT IN (select f.other_id from follows f where f.user_id= ?) AND users.id != ?", session[:user_id], session[:user_id]])
    end
    respond_to do |format|
      format.html
    end
  end
end
