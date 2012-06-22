class DuesTypeController < ApplicationController
  before_filter :authorize
  scaffold :dues_type
  layout :determine_layout
  
  def index
    @dues_type_pages, @dues_types = paginate :dues_types, :per_page => 10
  end
end
