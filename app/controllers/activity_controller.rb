class ActivityController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @activities = @user.activities

    @activity = current_user.activities.build(activity_params)
    @activity.user = @user
    @new_activity = activity.new

    authorize @activity

    if @activity.save
      flash[:notice] = "activity was created."
    else
      flash[:error] = "There was an error saving the activity. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def activity_params
    params.require(:activity)..permit_all_parameters
  end

end
