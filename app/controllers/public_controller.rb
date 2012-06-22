class PublicController < ApplicationController
  # GET /stories;pubindex
  # GET /stories.xml
  def stories
    @stories = Story.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @stories.to_xml }
    end
  end
end
