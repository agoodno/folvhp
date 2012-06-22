class CommentController < ApplicationController
  
  def index
    new
    render :action => 'new'
  end
  
  def new
    @start_subject = 'Re: ' + params[:id] + ' page'
  end

  def create
    @comment = Comment.new(params[:comment])
    if Notifier.deliver_comment_notification(@comment) # sends the email
      flash[:notice] = 'Your comment was sent.'
      redirect_to :controller => 'page', :action => 'view', :id => 'welcome'
    else
      render :action => 'new'
    end
  end
  
end
