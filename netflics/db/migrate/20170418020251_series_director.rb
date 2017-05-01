class SeriesDirector < ActiveRecord::Migration[5.0]
  def change
    create_table :series_directors, :id => false do |t|
      t.integer :director_id
      t.integer :series_id
    end
  end
end
