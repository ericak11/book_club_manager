# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  date       :string
#  time       :string
#  location   :string
#  map        :string
#  partner_id :integer
#  book_id    :integer
#  notes      :string
#  created_at :datetime
#  updated_at :datetime
#

class Event < ActiveRecord::Base
  belongs_to :partner
  belongs_to :book
  has_many :responses
  has_many :wines
  has_many :recipes
  accepts_nested_attributes_for :book
  default_scope { order('date DESC') }
  scope :future, -> { where('date >= ?', Date.today).order(:date) }
  validates :date, :time, :partner, :presence => true
  after_update :check_for_email_send
  paginates_per 10

  def self.next_event
    Event.where('date <= ?', Date.today).order(:date).first
  end
  def my_event?(partner_id)
    self.partner_id == partner_id
  end
  def check_for_email_send
    changes = self.changes
    changes.delete("updated_at")
    changes.delete("partner_id")
    EventNotifier.send_event_update_email(self, changes).deliver_now unless changes.empty?
  end

  def has_not_responded
    responded_users = self.responses.collect(&:user_id)
    User.members.where("id NOT IN (?)", responded_users)
  end
end
