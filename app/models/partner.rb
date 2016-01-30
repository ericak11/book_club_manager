# == Schema Information
#
# Table name: partners
#
#  id        :integer          not null, primary key
#  host_id   :integer
#  cohost_id :integer
#  rank      :integer
#

class Partner < ActiveRecord::Base
  belongs_to :host, :class_name => 'User'
  belongs_to :cohost, :class_name => 'User'
  validates :rank, :presence => true
  validates_uniqueness_of :cohost_id , :scope => :host_id

  def self.get_weeks
    (1..8).to_a - Partner.all.collect(&:rank)
  end
  def pretty_print_partners
    "#{self.host.full_name} & #{self.cohost.full_name}"
  end
  def ids
    [self.host_id, self.cohost_id]
  end
end
