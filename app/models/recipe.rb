# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  event_id    :integer
#  link        :string
#  title       :string
#  description :string
#  image       :string
#  created_at  :datetime
#  updated_at  :datetime
#

class Recipe < ActiveRecord::Base
  belongs_to :event
  validates :event_id, :title, :description, :presence => true

  paginates_per 10
end
