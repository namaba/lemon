1.upto(101) do |i|
  User.seed(:id) do |u|
    u.id = i
    u.email = "test#{i}@test.com"
    u.encrypted_password = "$2a$10$JMDTqq8mJPfvmdBZBcbV2u3og.5SQ4BygItc6nzbKDqP094HtiQZG"
    u.name = "test#{i}"
  end

  UserProfile.seed(:user_id) do |up|
    up.id = i
    up.user_id = i
    up.sex = [*1..4].sample
    up.play_style = [*1..3].sample
    up.birthday = Date.today - [*20..40].sample.years
    up.address = [*1..47].sample
    up.introduce = 'はじめまして、よろしくおねがいします'
    up.height = [*140..190].sample
    up.style = [*1..9].sample
    up.job = [*1..40].sample
    up.income = [*1..9].sample
    up.hobby = '読書、映画、ドライブ'
    up.housemate = [*1..3].sample
    up.alcohol = [*1..3].sample
    up.smoke = [*1..6].sample
    up.purpose = [*1..3].sample
    up.marriage = [*1..4].sample
    up.child = [*1..3].sample
    up.personality = '明るい、優しい、アウトドア'
    up.holiday = [*1..3].sample
    up.to_meet = [*1..4].sample
    up.blood_type = [*1..5].sample
    up.school = [*1..5].sample
    up.bro_sis = [*1..5].sample
    up.identification = 1
    up.answer_rate = 99
    up.good_count = 20
    up.coins_count = 20
    up.mail_status = 1
    up.tutorial_status = 99
  end

  UserStatus.seed(:id) do |us|
    us.id = i
    us.good_count = 0
    us.free_coin = 0
    us.pay_coin = 0
  end
end
