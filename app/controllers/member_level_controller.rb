class MemberLevelController < ApplicationController
  scaffold :member_level
  layout :determine_layout
  
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @member_level_pages, @member_levels = paginate :member_levels, :per_page => 10
  end

end
