# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  event_id   :integer
#  status     :string
#  comment    :string
#  created_at :datetime
#  updated_at :datetime
#

class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  validates :event, :user, :status, :presence => true
  validates_uniqueness_of :user_id , :scope => :event_id

  def self.response_options
    ["Yes!", "No.", "Maybe?"]
  end
end
