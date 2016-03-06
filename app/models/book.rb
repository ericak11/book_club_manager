# == Schema Information
#
# Table name: books
#
#  id           :integer          not null, primary key
#  title        :string
#  link         :string
#  description  :string
#  author       :string
#  publish_date :string
#  image        :string
#

class Book < ActiveRecord::Base
  has_one :event
  validates :title, :author, presence: true
  validates :book_club_date, presence: true, unless: :skip_date_validation
  attr_accessor :skip_date_validation
  paginates_per 10
end
