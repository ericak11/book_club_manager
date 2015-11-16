class Partner < ActiveRecord::Base
  has_one :host, :class_name => 'User', :foreign_key => 'host_id'
  has_one :cohost, :class_name => 'User', :foreign_key => 'cohost_id'
end
