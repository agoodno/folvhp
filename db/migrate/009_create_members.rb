class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.column :first_name, :string, :limit=>50, :null=>false
      t.column :middle_name, :string, :limit=>50, :null=>false
      t.column :last_name, :string, :limit=>50, :null=>false
      t.column :line1, :string, :limit=>50, :null=>false
      t.column :line2, :string, :limit=>50, :null=>false
      t.column :city, :string, :limit=>50, :null=>false
      t.column :state_id, :integer, :null=>false
      t.column :zip_code, :string, :limit=>10, :null=>false
      t.column :home_phone, :string, :limit=>20
      t.column :created_at, :datetime, :null=>false
      t.column :updated_at, :datetime, :null=>false
    end
    Member.create(
      :first_name=>"Andrew",
      :middle_name=>"Gregory",
      :last_name=>"Goodnough",
      :line1=>"1538 Lake View Ave.",
      :line2=>"",
      :city=>"Madison",
      :state_id=>49,
      :zip_code=>"53704",
      :home_phone=>"608-246-8788"
      )
  end

  def self.down
    drop_table :members
  end
end
