class Comment
  attr_accessor :sender_email, :subject, :message
  
  def initialize(params)
    @sender_email = params[:sender_email]
    @subject = params[:subject]
    @message = params[:message]
  end

end
