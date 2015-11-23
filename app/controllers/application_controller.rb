class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :test_runkeeper

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  def test_runkeeper
    # puts "testing run keeper"
    # puts params
    # access_token
    if params[:code]
      access_token = HealthGraph.access_token(params[:code])
      # puts access_token
      # puts "hello"

      runkeeper_user = HealthGraph::User.new(access_token)
      activities = runkeeper_user.fitness_activities.body.to_json
      activities_hash = JSON.parse activities
      # puts activities
      current_user.runkeeper_id = runkeeper_user.access_token
      current_user.save!
      activities_hash["items"].each do |activity|
        local_activity = current_user.activities.create
        local_activity.start_time = activity["start_time"]
        local_activity.source = activity["source"]
        local_activity.type = activity["type"]
        local_activity.utc_offset = activity["utc_offset"]
        local_activity.total_distance = activity["total_distance"]
        local_activity.duration = activity["duration"]
        local_activity.average_heart_rate = activity["average_heart_rate"]
        local_activity.total_calories = activity["total_calories"]
        local_activity.climb = activity["climb"]
        local_activity.notes = activity["notes"]

        local_activity.save
        puts "8888888 " + local_activity.to_s + " 888888888"
        # local_activity = current_user.activity.new
        # local_activity = activity
      end
      # puts runkeeper_user
      # activity = runkeeper_user.fitness_activity_summary('uri' => 'uri-of-activity')
    end

  end
end
