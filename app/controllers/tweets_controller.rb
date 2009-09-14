class TweetsController < ApplicationController
  def create
    if !session[:user_id]
      flash[:notice] = "You must be logged in to tweet"
      redirect_to root_path
    end

    @tweet = Tweet.create(:user_id => session[:user_id], :message => params[:message])
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to root_path }
      else
        flash[:error] = @tweet.errors.full_messages.join("</br/>")
        format.html { redirect_to root_path }
      end
    end
  end
end
