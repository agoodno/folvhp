class PageController < ApplicationController
  before_filter :authorize, :except => :view
  scaffold :page
  layout :determine_layout
  
  def list
    @page_pages, @pages = paginate :pages, :per_page => 50
  end
  
  def view
    @page = Page.find_by_title(params[:title])
  end
  
end
