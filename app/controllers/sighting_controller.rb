class SightingController < ApplicationController
  before_filter :authorize, :except => :index
  scaffold :sighting
  layout :determine_layout

  def index
    @sighting_pages, @sightings = paginate :sightings, :per_page => 10
  end
  
end
