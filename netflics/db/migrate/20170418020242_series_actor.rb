class SeriesActor < ActiveRecord::Migration[5.0]
  def change
    create_table :series_actors, :id => false do |t|
      t.integer :actor_id
      t.integer :series_id
    end
  end
end
