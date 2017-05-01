class CreateEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_table :episodes do |t|
      t.belongs_to :season, foreign_key: true
      t.string :name
      t.integer :length
      t.text :summary
      t.integer :number
      t.string :name

      t.timestamps
    end
  end
end
