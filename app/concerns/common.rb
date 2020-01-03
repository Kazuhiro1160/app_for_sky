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

  def date_display(ele)
    date = DateTime.now
     if ele.strftime("%Y%m%d") == date.strftime("%Y%m%d")
      '今日'
     elsif ele < date && ele > date - 1.days
      '昨日'
     else
       ele.strftime("%Y年%m月%d日")
    end
  end

  def day_of_week(ele)
    wd = %w(日 月 火 水 木 金 土)
    ele.strftime("%m月%d日(#{wd[ele.wday]})")
  end

  def full_name(first_name, last_name)
    "#{first_name}" + "#{last_name}"
  end

  def change_d_id(model)
    ids = []
    count = model.size
    model.each_with_index do |mdl, i|
      if i < count - 1
        li = i + 1
        lst_model = model[li]
        mdl_d = mdl.created_at
        lst_mdl_d = lst_model.created_at
        unless mdl_d.strftime("%y%m%d") == lst_mdl_d.strftime("%y%m%d")
          id = mdl.id
          ids << id
        end
      end
    end
    ids
  end

  def change_d_judge(ids, post)
    r = false
    ids.each do |id|
      if id == post.id
        return true
      end
    end
    r
  end

  def file_icon(file_name)
    file = file_name.to_s
    if file.match?(/.pdf/)
      return 'pdf'
    elsif file.match?(/.xls/) || file.match?(/.xlsx/)
      return 'excel'
    elsif file.match?(/.doc/) || file.match?(/.docx/)
      return 'word'
    elsif file.match?(/.ppt/) || file.match?(/.pptx/)
      return 'ppt'
    end
  end


end