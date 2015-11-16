class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.integer :event_id
      t.string :name
      t.string :type
      t.string :color
      t.string :description
      t.string :image
      t.string :link
      t.timestamps
    end
  end
end
