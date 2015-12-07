class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

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

  def runkeeper_setup
    @user = current_user
    runkeeper_user = HealthGraph::User.new(@user.runkeeper_id)
    num_activities = runkeeper_user.fitness_activities.size
    fitness_activities = runkeeper_user.fitness_activities :pageSize => num_activities
    @items = fitness_activities.items
    @activity_types = Array.new
    @activity_dates = Array.new
    @activity_distances = Array.new
    @activity_calories = Array.new
    @collection = Collection.new

    @items.each do |item|
      @activity_dates << item.start_time.to_time.strftime("%b %d")
      if !@activity_types.include?item.type then
        @activity_types << item.type
      end
    end

    @activity_types.each do |type|
      @items.each do |item|
        if item.type = type then
          @activity_distances << item.total_distance#Unit.new("#{item.total_distance} m").convert_to ('mi')
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

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

end
