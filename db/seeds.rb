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
  user.login_id = adm_pass
  user.password = adm_pass
  user.pass_fog = 0
  user.admin = 1
  user.user_grade = 100
end


(1..20).to_a.each do |uele|
  mem = uele + 1
  id =random_uid(8)

  User.find_or_create_by(id: mem) do |m|
    m.first_name = '小林'
    m.last_name = '一郎'
    m.email = 'user'+"#{uele}"+'@example.com'
    m.login_id = "#{id}" + "#{uele}"
    m.password = "#{id}" + "#{uele}"
    m.sex = "0"
    m.pass_fog = 1
    m.admin = 0
    if uele >= 15
      m.user_grade = 3
    elsif uele >= 8
      m.user_grade = 2
    else
      m.user_grade = 1
    end
  end
end
