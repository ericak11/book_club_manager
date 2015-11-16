class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :link
      t.string :description
      t.string :author
      t.string :publish_date
      t.string :image
    end
  end
end
