# == Schema Information
#
# Table name: books
#
#  id             :integer          not null, primary key
#  title          :string
#  link           :string
#  description    :string
#  author         :string
#  publish_date   :string
#  image          :string
#  book_club_date :string
#

class Book < ActiveRecord::Base
  has_one :event
  has_many :reviews
  validates :title, :author, presence: true
  validates :book_club_date, presence: true, unless: :skip_date_validation
  attr_accessor :skip_date_validation
  paginates_per 10

  def has_not_reviewed(user)
    !self.reviews.collect(&:user_id).include? user.id
  end

  def average_rating
    scores = self.reviews.collect(&:rating)
    scores.empty? ? "n/a" : scores.sum.to_f / scores.size.to_f
  end
end
