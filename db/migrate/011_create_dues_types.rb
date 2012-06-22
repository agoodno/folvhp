class CreateDuesTypes < ActiveRecord::Migration
  def self.up
    create_table :dues_types do |t|
      t.column :description, :string, :limit=>50, :null=>false
    end
    DuesType.create(:description=>"Dollars")
    DuesType.create(:description=>"Time Dollars")
    DuesType.create(:description=>"In Kind")
  end

  def self.down
    drop_table :dues_types
  end
end
