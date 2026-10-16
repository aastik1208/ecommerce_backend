module DateHelper

  def date_format date
    return "" if date.nil?
    date.strftime("%B %d, %Y")
  end 

  def date_time_format date
    return "" if date.nil?
    date.strftime("%F %H:%M %p")
  end

  def time_format date
    return "" if date.nil?
    date.strftime("%H:%M %p")
  end

  def datetime_format date
    return "" if date.nil?
    date.strftime("%F %H:%M")
  end

end
