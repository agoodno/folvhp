class State < ActiveRecord::Base
  has_many :households
  has_many :join_requests
end
