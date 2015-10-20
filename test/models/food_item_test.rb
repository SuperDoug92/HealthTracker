# == Schema Information
#
# Table name: food_items
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  recipes_id  :integer
#  users_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class FoodItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
