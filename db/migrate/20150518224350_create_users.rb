class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :bio
      t.integer :weight
      t.string :email
      t.string :username
      t.integer :goal_weight

      t.timestamps
      has_many: recipes
      has_many: food_items
    end
  end
end
