class Book < ActiveRecord::Base
  has_one :event
end
