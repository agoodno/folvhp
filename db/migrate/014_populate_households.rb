class PopulateHouseholds < ActiveRecord::Migration
  def self.up
    down
    
    directory = File.join(File.dirname(__FILE__), "dev_data")
    Fixtures.create_fixtures(directory, "households")
  end

  def self.down
    Household.delete_all
  end
end
