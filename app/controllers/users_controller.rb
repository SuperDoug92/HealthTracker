class UsersController < ApplicationController

  def index
  end

  def new

  end

  def show
    @user = params[:id].nil? ? current_user : User.find(params[:id])

    @runkeeper_activity = RunkeeperActivity.new(@user)

    # runkeeper_user = HealthGraph::User.new(@user.runkeeper_id)
    @runkeeper_activity.table

    gon.activity_types = @runkeeper_activity.activity_types
    @items = @runkeeper_activity.items

    @runkeeper_activity.chart
    gon.max_distance = @runkeeper_activity.max_distance
    gon.activity_dates = @runkeeper_activity.activity_dates
    gon.running_pr_series = @runkeeper_activity.running_pr_series
    gon.running_current_series = @runkeeper_activity.running_current_series
    gon.swimming_pr_series = @runkeeper_activity.swimming_pr_series
    gon.swimming_current_series = @runkeeper_activity.swimming_current_series
    gon.cycling_pr_series = @runkeeper_activity.cycling_pr_series
    gon.cycling_current_series = @runkeeper_activity.cycling_current_series

    gon.series = @runkeeper_activity.series

  end

  def edit
  end
end
