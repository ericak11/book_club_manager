# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  first_name         :string
#  last_name          :string
#  email              :string
#  phone_number       :string
#  encrypted_password :string(128)      not null
#  confirmation_token :string(128)
#  remember_token     :string(128)      not null
#  created_at         :datetime
#  updated_at         :datetime
#  admin              :boolean
#

class User < ActiveRecord::Base
  include Clearance::User
  has_many :responses
  has_many :reviews

  validates :first_name, :last_name, :email, :presence => true
  def self.has_no_partner
    ids = (Partner.all.collect(&:host_id) + Partner.all.collect(&:cohost_id)).uniq
    User.where.not(id: ids)
  end
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  def partner_id
    Partner.where('host_id=? OR cohost_id=?', self.id, self.id).first.try(:id)
  end
end
