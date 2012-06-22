class CreateSightings < ActiveRecord::Migration
  def self.up
    create_table :sightings do |t|
      t.column "title", :string
      t.column "description", :text
      t.column "entry_date", :date
    end
  end

  def self.down
    drop_table :sightings
  end
end
