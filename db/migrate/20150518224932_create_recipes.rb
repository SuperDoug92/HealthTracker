class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :decription
      t.belongs_to :users

      t.timestamps

    end
  end
end
