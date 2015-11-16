class Activities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :source
      t.string :type
      t.datetime :start_time
      t.integer :utc_offset
      t.decimal :total_distance
      t.decimal :duration
      t.integer :average_heart_rate
      t.decimal :total_calories
      t.decimal :climb
      t.text :notes
      t.belongs_to :users
      t.timestamps
    end
  end
end
