# == Schema Information
#
# Table name: activities
#
#  id                 :integer          not null, primary key
#  source             :string(255)
#  type               :string(255)
#  start_time         :datetime
#  utc_offset         :integer
#  total_distance     :decimal(, )
#  duration           :decimal(, )
#  average_heart_rate :integer
#  total_calories     :decimal(, )
#  climb              :decimal(, )
#  notes              :text
#  user_id            :integer
#  created_at         :datetime
#  updated_at         :datetime
#

class Activity < ActiveRecord::Base
  belongs_to :user

end
