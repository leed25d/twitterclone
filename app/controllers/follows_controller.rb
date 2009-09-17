class FollowsController < ApplicationController
  def create
    @follow = current_user.follows.build(:other_id => params[:other_id])
    if @follow.save
      flash[:notice] = "Added follow."
      redirect_to root_url
    else
      flash[:error] = "Error occurred when adding follow."
      redirect_to root_url
    end
  end

  def destroy
    @follow = current_user.follows.find(params[:id])
    @follow.destroy
    flash[:notice] = "Successfully destroyed follow."
    redirect_to root_url
  end
end
