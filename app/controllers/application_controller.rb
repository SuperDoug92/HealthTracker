class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :test_runkeeper
  before_action :runkeeper_setup

  class Collection
    attr_accessor :series

    def initialize(series = [])
      @series = series
      series
    end
  end


  class Series
    attr_accessor :name, :data
    def initialize(name = nil, data = [])
      @name, @data = name, data
      name
      data
    end
  end

  def test_runkeeper
    # puts "testing run keeper"
    # puts params
    # access_token
    if params[:code] && current_user && current_user.runkeeper_id == nil
      access_token = HealthGraph.access_token(params[:code])
      # puts access_token
      # puts "hello"

      runkeeper_user = HealthGraph::User.new(access_token)
      activities = runkeeper_user.fitness_activities.body.to_json
      activities_hash = JSON.parse activities
      # puts activities
      current_user.runkeeper_id = runkeeper_user.access_token
      current_user.save!
    end

  end

  def runkeeper_setup
    # raise
    if current_user && current_user.runkeeper_id
      @user = current_user
      # raise
      runkeeper_user = HealthGraph::User.new(@user.runkeeper_id)
      num_activities = runkeeper_user.fitness_activities.size
      fitness_activities = runkeeper_user.fitness_activities :pageSize => num_activities
      @items = fitness_activities.items
      @activity_types = Array.new
      @activity_dates = Array.new
      @collection = Collection.new
      gon.max_distance = 0

      @items.each do |item|
        @activity_dates << item.start_time.to_time.strftime("%b %d")
        if !@activity_types.include?item.type
          @activity_types << item.type
        end
      end

      @activity_types.each do |type|
        @activity_distances = Array.new
        @activity_calories = Array.new
        @items.each do |item|

          if item.type == type
            distance = item.total_distance/1609.34
            if gon.max_distance < distance
              gon.max_distance = distance
            end

            @activity_distances << distance

            @activity_calories << item.total_calories
          else
            @activity_distances << 0
            @activity_calories << 0
          end
        end

        @collection.series << Series.new(type, @activity_distances)
      end

      gon.activity_dates = @activity_dates
      gon.series = @collection.series
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

end
