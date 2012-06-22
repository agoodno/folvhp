class JoinRequest < ActiveRecord::Base
  belongs_to :state
  validates_presence_of :first_name, :last_name, :line1, :city, :state_id, :zip_code, :dues_amount
  
  def full_name
    return first_name + " " + last_name
  end

  def full_address
    return line1 + " " + line2 + " " + city + ", " + state.name + " " + zip_code
  end
  
end
