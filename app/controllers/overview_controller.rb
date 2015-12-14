class OverviewController < ApplicationController
  def index
  end

  def chart1
    @runkeeper_activity = RunkeeperActivity.new(current_user)
    @runkeeper_activity.chart
    gon.max_distance = @runkeeper_activity.max_distance
    gon.activity_dates = @runkeeper_activity.activity_dates

    gon.series = @runkeeper_activity.series
    # raise
    # puts runkeeper_activity.questions
    # puts runkeeper_activity.users
  end
end
