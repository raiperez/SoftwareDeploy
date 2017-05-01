class CreateSeries < ActiveRecord::Migration[5.0]
  def change
    create_table :series do |t|
    	t.string  :name
      t.integer :genre, default:0
      t.integer :country, default:0
      t.integer :language, default:0
      t.text    :summary

      t.timestamps
    end
  end
end
