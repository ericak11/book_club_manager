class Event < ActiveRecord::Base
  belongs_to :partner
  belongs_to :book
  has_many :responses
  has_many :wines
  has_many :recipes
  accepts_nested_attributes_for :book, :partner
end
