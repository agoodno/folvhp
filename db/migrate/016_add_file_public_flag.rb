class AddFilePublicFlag < ActiveRecord::Migration
  def self.up
    add_column :uploaded_files, :is_public, :boolean, :default => false
    add_column :uploaded_files, :created_at, :datetime, :null => false, :default => Time.now
    add_column :uploaded_files, :updated_at, :datetime, :null => false, :default => Time.now
  end

  def self.down
    remove_column :uploaded_files, :is_public
    remove_column :uploaded_files, :created_at
    remove_column :uploaded_files, :updated_at
  end
end
