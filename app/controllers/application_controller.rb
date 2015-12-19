class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :test_runkeeper
  # before_action :runkeeper_setup

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

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

end
