class CreateSeasons < ActiveRecord::Migration[5.0]
  def change
    create_table :seasons do |t|
      t.belongs_to :series, foreign_key: true
      t.integer :number
      t.integer :year
      t.text :summary

      t.timestamps
    end
  end
end
