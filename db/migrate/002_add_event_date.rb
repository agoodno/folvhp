class AddEventDate < ActiveRecord::Migration
  def self.up
    add_column :events, :start_date_time, :datetime
    add_column :events, :end_date_time, :datetime
  end

  def self.down
    remove_column :events, :start_date_time
    remove_column :events, :end_date_time
  end
end
