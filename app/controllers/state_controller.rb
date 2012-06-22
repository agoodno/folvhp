class StateController < ApplicationController
  before_filter :authorize
  scaffold :state
  layout :determine_layout
  
  def list
    @state_pages, @states = paginate :states, :per_page => 50
  end
  
end
