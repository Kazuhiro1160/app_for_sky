def random_uid(num=4)
  SecureRandom.alphanumeric(num).downcase
end

adm_email = 'admin@admin.com'
adm_pass = 'ntgwsky0'

Admin.find_or_create_by(id:1) do |admin|
  admin.email = adm_email
  admin.password = adm_pass
end


User.find_or_create_by(id: 1) do |user|
  user.first_name = 'Matsubara'
  user.last_name = 'Noriko'
  user.email = adm_email
  user.usr_login_id = adm_pass
  user.password = adm_pass
  user.pass_fg = 0
  user.admin = 1
  user.usr_grade = 100
  user.usr_class = 100
end


(1..30).to_a.each do |uele|
  mem = uele + 1
  id =random_uid(8)

  User.find_or_create_by(id: mem) do |m|
    m.first_name = '小林'
    m.last_name = "#{uele}"+ "郎"
    m.email = 'user'+"#{uele}"+'@example.com'
    m.usr_login_id = "#{id}" + "#{uele}"
    m.password = "#{id}" + "#{uele}"
    m.usr_sex = "0"
    m.pass_fg = 1
    m.set_fg = 1
    m.admin = 0
    if uele >= 21
      m.usr_grade = 3
      if uele >= 26
        m.usr_class = 6
      else
        m.usr_class = 5
      end
    elsif uele >= 11
      m.usr_grade = 2
      if uele >= 16
        m.usr_class = 4
      else
        m.usr_class = 3
      end
    else
      m.usr_grade = 1
      if uele >= 6
        m.usr_class = 2
      else
        m.usr_class = 1
      end
    end
  end
end
