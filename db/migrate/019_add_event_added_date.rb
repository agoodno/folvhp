class AddEventAddedDate < ActiveRecord::Migration
  def self.up
    add_column :events, :created_at, :datetime, :null => false, :default => '2007-12-01'
    add_column :events, :updated_at, :datetime, :null => false, :default => '2007-12-01'
  end

  def self.down
    remove_column :events, :created_at
    remove_column :events, :updated_at
  end
end
