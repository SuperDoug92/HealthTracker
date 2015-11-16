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
    puts "testing run keeper"
    puts params
    # access_token
    if params[:code]
      access_token = HealthGraph.access_token(params[:code])
      puts access_token
      puts "hello"

      user = HealthGraph::User.new(access_token)

      puts user
      activity = user.fitness_activity_summary('uri' => 'uri-of-activity')
      raise
    end

  end
end
