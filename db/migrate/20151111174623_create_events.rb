class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :date
      t.string :time
      t.string :location
      t.string :map
      t.integer :partner_id
      t.integer :book_id
      t.string :notes
      t.timestamps
    end
  end
end
