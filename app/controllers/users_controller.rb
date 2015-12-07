class UsersController < ApplicationController
  def index
  end

  def new

  end

  def show
    @user = User.find(params[:id])
    runkeeper_user = HealthGraph::User.new(@user.runkeeper_id)
    num_activities = runkeeper_user.fitness_activities.size
    fitness_activities = runkeeper_user.fitness_activities :pageSize => num_activities
    @items = fitness_activities.items
    @activity_types = Array.new
    @items.each do |item|
      if item.total_distance > 0 and !@activity_types.include?item.type then
        @activity_types << item.type
      end
    end
    gon.activity_types = @activity_types

  end

  def edit
  end
end
