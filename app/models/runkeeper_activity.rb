# Or wrap things up in your own class
class RunkeeperActivity

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

  include HTTParty
  base_uri 'api.stackexchange.com'

  def initialize(user)
    @user = user
    @runkeeper_user = HealthGraph::User.new(@user.runkeeper_id)
  end

  def chart

    num_activities = @runkeeper_user.fitness_activities.size
    fitness_activities = @runkeeper_user.fitness_activities :pageSize => num_activities
    @items = fitness_activities.items
    @activity_types = Array.new
    @activity_dates = Array.new
    @collection = Collection.new
    @running_pr = Array.new
    @running_recent = Array.new
    @max_distance = 0

    @items.each do |item|
      @activity_dates << item.start_time.to_time.strftime("%b %d")
      if !@activity_types.include?item.type
        @activity_types << item.type
      end
    end

    @activity_types.each do |type|
      @activity_distances = Array.new
      @activity_calories = Array.new
      @activity_duration = Array.new
      @type_start_times = Array.new
      @items.each do |item|

        if item.type == type
          distance = item.total_distance/1609.34
          if @max_distance < distance
            @max_distance = distance
          end

          @activity_distances << distance
          @activity_duration << item.duration
          @activity_calories << item.total_calories
          @type_start_times << item.start_time.to_time
        else
          @activity_distances << 0
          @activity_calories << 0
          @activity_duration << 0
          @type_start_times << 0
        end
      end

      if type == "Running"
        # @activity_distances.zip(@type_start_times).zip(@activity_duration).sort_by{|activity| activity.activity_duration}each do |distance, start_time, duration|
        #   for i in 0..distance.floor
        #     if  @running_recent[i].nil? && distance > 0 && !duration.nil?
        #       @running_recent[i] = ((duration/60)/distance).round(2)
        #     elsif distance > 0 && !duration.nil? && (duration/60)/distance < @running_pr[i]
        #       @running_pr[i] = ((duration/60)/distance).round(2)
        #     end
        #   end
        # end

        @activity_distances.zip(@activity_duration).each do |distance, duration|
          for i in 0..distance.floor
            if  @running_pr[i].nil?
              @running_pr[i] = ((duration/60)/distance).round(2)
            elsif distance > 0 && !duration.nil? && (duration/60)/distance < @running_pr[i]
              @running_pr[i] = ((duration/60)/distance).round(2)
            end
          end
        end
        @running_pr_series = Series.new("Record", @running_pr)

      end

      @collection.series << Series.new(type, @activity_distances)
    end

    @activity_dates = @activity_dates
    @series = @collection.series

  end

  def running_pr_series
    @running_pr_series
  end

  def max_distance
    @max_distance
  end

  def activity_dates
    @activity_dates
  end

  def series
    @series
  end

  def table
    num_activities = @runkeeper_user.fitness_activities.size
    fitness_activities = @runkeeper_user.fitness_activities :pageSize => num_activities
    @items = fitness_activities.items
    @activity_types = Array.new
    @items.each do |item|
      if item.total_distance > 0 and !@activity_types.include?item.type then
        @activity_types << item.type
      end
    end
  end

  def activity_types
    @activity_types
  end

  def items
    @items
  end

end
