class CreateMemberLevels < ActiveRecord::Migration
  def self.up
    create_table :member_levels do |t|
      t.column :description, :string, :limit=>50, :null=>false
    end
    MemberLevel.create(:description=>"Contributing Member")
    MemberLevel.create(:description=>"Member")
  end

  def self.down
    drop_table :member_levels
  end
end
