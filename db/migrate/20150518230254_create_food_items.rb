class CreateFoodItems < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.string :name
      t.text :description
      t.belongs_to :recipes, index: true
      t.belongs_to :users, index: true

      t.timestamps

    end
  end
end
