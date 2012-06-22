require 'technoweenie/acts_as_attachment'
require 'technoweenie/acts_as_attachment/class_methods'
require 'technoweenie/acts_as_attachment/db_file_methods'
require 'technoweenie/acts_as_attachment/file_system_methods'
require 'technoweenie/acts_as_attachment/instance_methods'

class UploadedFile < ActiveRecord::Base
  acts_as_attachment :storage => :file_system, :max_size => 5000.kilobytes
  validates_as_attachment
end
