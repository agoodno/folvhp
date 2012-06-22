class PopulateMembers < ActiveRecord::Migration
  def self.up
    down
   
    create_table :members do |t|
      t.column :household_id, :integer, :null=>false
      t.column :first_name, :string, :limit=>50, :null=>false
      t.column :last_name, :string, :limit=>50, :null=>false
      t.column :home_phone, :string, :limit=>20
      t.column :business_phone, :string, :limit=>20
      t.column :mobile_phone, :string, :limit=>20
      t.column :email_address, :string, :limit=>50
      t.column :member_level_id, :integer, :null=>false
      t.column :board_title_id, :integer, :null=>false
      t.column :created_at, :datetime, :null=>false
      t.column :updated_at, :datetime, :null=>false
    end   
   
    directory = File.join(File.dirname(__FILE__), "dev_data")
    Fixtures.create_fixtures(directory, "members")
  end

  def self.down
    Member.delete_all
    begin
      drop_table :members
    rescue
      nil
    end
  end
end
