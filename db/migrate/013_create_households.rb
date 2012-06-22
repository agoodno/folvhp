class CreateHouseholds < ActiveRecord::Migration
  def self.up
    create_table :households do |t|
      t.column :old_id, :integer, :null=>false
      t.column :name, :string, :limit=>50, :null=>false
      t.column :line1, :string, :limit=>50, :null=>false
      t.column :line2, :string, :limit=>50
      t.column :city, :string, :limit=>50, :null=>false
      t.column :state_id, :integer, :null=>false
      t.column :zip_code, :string, :limit=>10, :null=>false
    end
  end

  def self.down
    drop_table :households
  end
end
