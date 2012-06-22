class CreateBoardTitles < ActiveRecord::Migration
  def self.up
    create_table :board_titles do |t|
      t.column :description, :string, :limit=>50, :null=>false
    end
    BoardTitle.create(:description=>"President")
    BoardTitle.create(:description=>"Vice President")
    BoardTitle.create(:description=>"Secretary")
    BoardTitle.create(:description=>"Treasurer")
    BoardTitle.create(:description=>"Director")
    BoardTitle.create(:description=>"Member")
  end

  def self.down
    drop_table :board_titles
  end
end
