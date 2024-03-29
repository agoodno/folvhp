class StoriesController < ApplicationController
  before_filter :authorize
  layout "admin"
  
  # GET /stories
  # GET /stories.xml
  def index
    @stories = Story.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @stories.to_xml }
    end
  end
  
  # GET /stories/1
  # GET /stories/1.xml
  def show
    @story = Story.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @story.to_xml }
    end
  end

  # GET /stories/new
  def new
    @story = Story.new
  end

  # GET /stories/1;edit
  def edit
    @story = Story.find(params[:id])
  end

  # POST /stories
  # POST /stories.xml
  def create
    @story = Story.new(params[:story])

    respond_to do |format|
      if @story.save
        flash[:notice] = 'Story was successfully created.'
        format.html { redirect_to story_url(@story) }
        format.xml  { head :created, :location => story_url(@story) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @story.errors.to_xml }
      end
    end
  end

  # PUT /stories/1
  # PUT /stories/1.xml
  def update
    @story = Story.find(params[:id])

    respond_to do |format|
      if @story.update_attributes(params[:story])
        flash[:notice] = 'Story was successfully updated.'
        format.html { redirect_to story_url(@story) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @story.errors.to_xml }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.xml
  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    respond_to do |format|
      format.html { redirect_to stories_url }
      format.xml  { head :ok }
    end
  end
end
