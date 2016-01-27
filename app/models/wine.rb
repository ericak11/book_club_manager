# == Schema Information
#
# Table name: wines
#
#  id          :integer          not null, primary key
#  event_id    :integer
#  name        :string
#  type        :string
#  color       :string
#  description :string
#  image       :string
#  link        :string
#  created_at  :datetime
#  updated_at  :datetime
#

class Wine < ActiveRecord::Base
  belongs_to :event
end
