class UsersController < ApplicationController
  def index
  end

  def new

  end

  def show
    @user = User.find(params[:id])

    runkeeper_user = HealthGraph::User.new(@user.runkeeper_id)

    puts runkeeper_user
    fitness_activities = runkeeper_user.fitness_activities :pageSize => 50
    puts fitness_activities.items
    @items = fitness_activities.items
    # raise

    # activities = runkeeper_user.fitness_activities.body.to_json
    # activities_hash = JSON.parse activities
    # puts activities
    # current_user.runkeeper_id = runkeeper_user.access_token
    # current_user.save!
    # activities_hash["items"].each do |activity|
    #   # local_activity = current_user.activities.create
    #   local_activity
    #   local_activity.start_time = activity["start_time"]
    #   local_activity.source = activity["source"]
    #   local_activity.type = activity["type"]
    #   local_activity.utc_offset = activity["utc_offset"]
    #   local_activity.total_distance = activity["total_distance"]
    #   local_activity.duration = activity["duration"]
    #   local_activity.average_heart_rate = activity["average_heart_rate"]
    #   local_activity.total_calories = activity["total_calories"]
    #   local_activity.climb = activity["climb"]
    #   local_activity.notes = activity["notes"]
    #
    #   # local_activity.save
    #   puts "8888888 " + local_activity.to_s + " 888888888"
    #   # local_activity = current_user.activity.new
    #   # local_activity = activity
    # end

  end

  def edit
  end
end
