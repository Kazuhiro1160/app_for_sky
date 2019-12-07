module Common
  extend self


  def user_grade(ele)
    case ele
    when 1
      '中１'
    when 2
      '中２'
    when 3
      '中３'
    end
  end

  def time_display(ele)
    date = DateTime.now
     if ele.strftime("%Y%m%d") == date.strftime("%Y%m%d")
      '今日'
     elsif ele < date && ele > date - 1.days
      '昨日'
     else
       ele.strftime("%Y年%m月%d日")
    end
  end

  def full_name(first_name, last_name)
    "#{first_name}" + "#{last_name}"
  end
end