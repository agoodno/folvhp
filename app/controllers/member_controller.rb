class MemberController < ApplicationController
  scaffold :member
  layout :determine_layout
  
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @member_pages, @members = paginate :members, :per_page => 20, :order => "last_name"
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
    @households = Household.find_all
    @member_levels = MemberLevel.find_all
    @board_titles = BoardTitle.find_all
  end

  def create
    @member = Member.new(params[:member])
    if @member.save
      flash[:notice] = 'Member was successfully created.'
      redirect_to :action => 'list'
    else
      @households = Household.find_all
      @member_levels = MemberLevel.find_all
      @board_titles = BoardTitle.find_all
      render :action => 'new'
    end
  end

  def edit
    @member = Member.find(params[:id])
    @households = Household.find_all
    @member_levels = MemberLevel.find_all
    @board_titles = BoardTitle.find_all
  end

  def update
    @member = Member.find(params[:id])
    if @member.update_attributes(params[:member])
      flash[:notice] = 'Member was successfully updated.'
      redirect_to :action => 'show', :id => @member
    else
      render :action => 'edit'
    end
  end

  def destroy
    Member.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
  
end
