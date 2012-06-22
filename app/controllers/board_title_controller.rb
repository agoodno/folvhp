class BoardTitleController < ApplicationController
  before_filter :authorize
  
  scaffold :board_title
  layout :determine_layout
  
  def index
    @board_title_pages, @board_titles = paginate :board_titles, :per_page => 10
  end
end
