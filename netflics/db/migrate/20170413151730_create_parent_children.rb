class CreateParentChildren < ActiveRecord::Migration[5.0]
  def change
    create_table :parent_children, :id => false do |t|
      t.integer :user_id
      t.integer :child_id

      t.timestamps
    end
  end
end
