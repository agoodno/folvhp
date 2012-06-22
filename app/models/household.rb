class Household < ActiveRecord::Base
  belongs_to :state
  validates_presence_of :name, :line1, :city, :state_id, :zip_code
end
