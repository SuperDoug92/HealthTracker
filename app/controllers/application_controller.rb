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
      activities_hash["items"].each do |activity|
        local_activity = current_user.Activity.new
        local_activity.start_time = activity["start_time"]
        puts local_activity
        # local_activity = current_user.activity.new
        # local_activity = activity
      end
      # puts runkeeper_user
      # activity = runkeeper_user.fitness_activity_summary('uri' => 'uri-of-activity')
      raise
    end

  end
end
