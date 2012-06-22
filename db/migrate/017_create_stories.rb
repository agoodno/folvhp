class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.column "headline",   :string, :null => false
      t.column "byline",     :string, :null => false, :default => 'FOLVHP Board'
      t.column "content",    :text, :null => false
      t.column "created_on", :date, :null => false
      t.column "updated_on", :date, :null => false
    end
  end

  def self.down
    drop_table :stories
  end
end
