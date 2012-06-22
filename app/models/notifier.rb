class Notifier < ActionMailer::Base
  def comment_notification(comment)
    recipients "agoodno@gmail.com"
    from       comment.sender_email
    subject    comment.subject
    body       :comment => comment
  end  
end
