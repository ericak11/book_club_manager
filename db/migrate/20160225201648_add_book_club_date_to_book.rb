class AddBookClubDateToBook < ActiveRecord::Migration
  def change
    add_column :books, :book_club_date, :string
  end
end
