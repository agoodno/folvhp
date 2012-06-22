class UploadedFileController < ApplicationController
  
  before_filter :authorize, :except => :index
  scaffold :uploaded_file
  layout :determine_layout
  
  def index
    #@uploaded_files = UploadedFile.find_all_by_is_public(true)
    #puts @uploaded_files.size
    #@uploaded_file_pages, @uploaded_files = paginate_collection @uploaded_files, :per_page => 10
    
    @uploaded_file_pages = Paginator.new self, UploadedFile.count, 20, params[:page]
    @uploaded_files = UploadedFile.find :all,
                          :conditions => ["is_public = ?", true],
                          :order => 'updated_at DESC',
                          :limit  =>  @uploaded_file_pages.items_per_page,
                          :offset =>  @uploaded_file_pages.current.offset
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @uploaded_file_pages = Paginator.new self, UploadedFile.count, 20, params[:page]
    @uploaded_files = UploadedFile.find :all,
                          :order => 'updated_at DESC',
                          :limit  =>  @uploaded_file_pages.items_per_page,
                          :offset =>  @uploaded_file_pages.current.offset
  end

  def show
    @uploaded_file = UploadedFile.find(params[:id])
  end

  def new
    @uploaded_file = UploadedFile.new
    @uploaded_file.filename = "New"
  end

  def create
    @uploaded_file = UploadedFile.new(params[:uploaded_file])
    if @uploaded_file.save
      flash[:notice] = 'UploadedFile was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @uploaded_file = UploadedFile.find(params[:id])
  end

  def update
    @uploaded_file = UploadedFile.find(params[:id])
    if @uploaded_file.update_attributes(params[:uploaded_file])
      flash[:notice] = 'UploadedFile was successfully updated.'
      redirect_to :action => 'show', :id => @uploaded_file
    else
      render :action => 'edit'
    end
  end

  def destroy
    UploadedFile.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
