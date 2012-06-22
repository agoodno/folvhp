class CreateJoinRequests < ActiveRecord::Migration
  def self.up
    create_table :join_requests do |t|
      t.column :first_name, :string, :limit=>50, :null=>false
      t.column :middle_name, :string, :limit=>50
      t.column :last_name, :string, :limit=>50, :null=>false
      t.column :line1, :string, :limit=>50, :null=>false
      t.column :line2, :string, :limit=>50
      t.column :city, :string, :limit=>50, :null=>false
      t.column :state_id, :integer, :null=>false
      t.column :zip_code, :string, :limit=>10, :null=>false
      t.column :home_phone, :string, :limit=>20
      t.column :business_phone, :string, :limit=>20
      t.column :mobile_phone, :string, :limit=>20
      t.column :email_address, :string, :limit=>50
      t.column :dues_amount, :decimal, :null=>false
      t.column :why_interested, :text
      t.column :created_at, :datetime, :null=>false
      t.column :updated_at, :datetime, :null=>false
    end
  end

  def self.down
    drop_table :join_requests
  end
end
