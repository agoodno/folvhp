class Event < ActiveRecord::Base 
  
  def fmt_start_date_time
    start_date_time.strftime("%A, %B %d, %Y %I:%M %p")
  end
  
  def fmt_end_date_time
    end_date_time.strftime("%A, %B %d, %Y %I:%M %p")
  end
  
  def fmt_start_end
    if start_date_time.strftime("%A, %B %d, %Y") != end_date_time.strftime("%A, %B %d, %Y")
      fmt_start_date_time + " - " + fmt_end_date_time
    else
      fmt_start_date_time + " - " + end_date_time.strftime("%I:%M %p")
    end
  end
end
