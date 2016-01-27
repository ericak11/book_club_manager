class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  def self.response_options
    ["Yes!", "No.", "Maybe?"]
  end
end
