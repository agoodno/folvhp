class JoinRequestsController < ApplicationController
  # GET /join_requests
  # GET /join_requests.xml
  def index
    @join_requests = JoinRequest.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @join_requests.to_xml }
    end
  end

  # GET /join_requests/1
  # GET /join_requests/1.xml
  def show
    @join_request = JoinRequest.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @join_request.to_xml }
    end
  end

  # GET /join_requests/new
  def new
    @join_request = JoinRequest.new
    @join_request.state = State.find(49)
    @states = State.find_all
  end

  # GET /join_requests/1;edit
  def edit
    @join_request = JoinRequest.find(params[:id])
    @states = State.find_all
  end

  # POST /join_requests
  # POST /join_requests.xml
  def create
    @join_request = JoinRequest.new(params[:join_request])

    respond_to do |format|
      if @join_request.save
        flash[:notice] = 'JoinRequest was successfully created.'
        format.html { redirect_to join_request_url(@join_request) }
        format.xml  { head :created, :location => join_request_url(@join_request) }
      else
        @states = State.find_all
        format.html { render :action => "new" }
        format.xml  { render :xml => @join_request.errors.to_xml }
      end
    end
  end

  # PUT /join_requests/1
  # PUT /join_requests/1.xml
  def update
    @join_request = JoinRequest.find(params[:id])

    respond_to do |format|
      if @join_request.update_attributes(params[:join_request])
        flash[:notice] = 'JoinRequest was successfully updated.'
        format.html { redirect_to join_request_url(@join_request) }
        format.xml  { head :ok }
      else
        @states = State.find_all
        format.html { render :action => "edit" }
        format.xml  { render :xml => @join_request.errors.to_xml }
      end
    end
  end

  # DELETE /join_requests/1
  # DELETE /join_requests/1.xml
  def destroy
    @join_request = JoinRequest.find(params[:id])
    @join_request.destroy

    respond_to do |format|
      format.html { redirect_to join_requests_url }
      format.xml  { head :ok }
    end
  end
end
