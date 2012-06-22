class EventController < ApplicationController
  before_filter :authorize, :except => [:index, :rss]
  scaffold :event
  layout :determine_layout
  
  def index
    @event_pages = Paginator.new self, Event.count, 5, params[:page]
    @events = Event.find :all,
                          :order => 'start_date_time DESC',
                          :limit  =>  @event_pages.items_per_page,
                          :offset =>  @event_pages.current.offset
  end
  
  def rss
    @event_pages = Paginator.new self, Event.count, 20, params[:page]
    @events = Event.find :all,
                          :order => 'updated_at DESC',
                          :limit  =>  @event_pages.items_per_page,
                          :offset =>  @event_pages.current.offset
    #render  :layout =>  false
  end
  
end
