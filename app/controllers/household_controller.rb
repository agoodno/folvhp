class HouseholdController < ApplicationController
  scaffold :household
  layout :determine_layout
  
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @household_pages, @households = paginate :households, :per_page => 20, :order => "name"
  end

  def show
    @household = Household.find(params[:id])
  end

  def new
    @household = Household.new
    @household.state = State.find(49)
    @states = State.find_all
  end

  def create
    @household = Household.new(params[:household])
    if @household.save
      flash[:notice] = 'Household was successfully created.'
      redirect_to :action => 'list'
    else
      @states = State.find_all
      render :action => 'new'
    end
  end

  def edit
    @household = Household.find(params[:id])
    @states = State.find_all
  end

  def update
    @household = Household.find(params[:id])
    if @household.update_attributes(params[:household])
      flash[:notice] = 'Household was successfully updated.'
      redirect_to :action => 'show', :id => @household
    else
      render :action => 'edit'
    end
  end

  def destroy
    Household.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
