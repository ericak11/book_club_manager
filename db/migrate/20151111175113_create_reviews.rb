class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :book_id
      t.string :content
      t.integer :user_id
      t.timestamps
    end
  end
end
