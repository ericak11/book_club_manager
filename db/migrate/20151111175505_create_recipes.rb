class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :event_id
      t.string :link
      t.string :title
      t.string :description
      t.string :image
      t.timestamps
    end
  end
end
