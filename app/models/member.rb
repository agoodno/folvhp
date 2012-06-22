class Member < ActiveRecord::Base
  belongs_to :board_title
  validates_presence_of :first_name, :last_name
  
  def full_name
    return first_name + " " + last_name
  end

  def full_address
    return line1 + " " + line2 + " " + city + ", " + state.name + " " + zip_code
  end
  
end
