# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  book_id    :integer
#  content    :string
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  rating     :integer
#

class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
end
