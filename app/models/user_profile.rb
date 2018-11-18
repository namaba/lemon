class UserProfile < ActiveRecord::Base

  # 都道府県表示するgemに必要
  include JpPrefecture
  jp_prefecture :address


  belongs_to :user, inverse_of: :user_profile

  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader
  mount_uploader :identification_image, ImageUploader

  enum tutorial_status: { pending:1, completed: 99 }

  #----------------------------------------
  #  ** Status **
  #----------------------------------------
  enum sex:   {"L": 1, "G": 2, "B": 3, "T": 4, "S": 5}
  enum play_style:   {"タチ": 1, "ネコ": 2, "リバース": 3}
  enum blood_type:   {"A型": 1, "B型": 2, "O型": 3, "AB型": 4, "わからない": 5}
  enum bro_sis:   {"一人っ子": 1, "長男/長女": 2, "次男/次女": 3, "三男/三女": 4, "末っ子": 5}
  enum housemate:   {'一人暮らし': 1, '友達と一緒': 2, '実家暮らし': 3, 'その他': 99}
  enum style:       {"スリム": 1, "スレンダー": 2, "細マッチョ": 3, "普通": 4, "マッチョ": 5, "グラマー": 6, "ややぽっちゃり": 7, "ぽっちゃり": 8, "太め": 9}
  enum purpose:     {"恋人探し": 1, "友達探し": 2, "悩み相談": 3, "秘密": 99}
  enum alcohol:     {"飲む": 1, "ときどき飲む": 2, "飲まない": 3}
  enum smoke:       {"吸う": 1, "飲む時だけ吸う": 2, "禁煙者と一緒の時は吸わない": 3, "相手次第でやめる気でいる": 4, "電子タバコ": 5, "吸わない": 6}
  enum child:       {"無し": 1, "同居中": 2, "別居中": 3}
  enum to_meet:     {"すぐ会いたい": 1, "フィーリング次第": 2, "トークしてから": 3, "会わない": 4}
  enum marriage:    {"独身（未婚）": 1, "独身（離婚）": 2, "独身（死別）": 3, "既婚": 4}
  enum job:         {'会社員': 1, '弁護士': 2, '公認会計士': 3, '経営者・役員': 4, '公務員': 5, '事務員': 6, '大手商社': 7, '外資金融': 8, '大手企業': 9, '大手外資': 10, 'クリエイター': 11, 'IT関連': 12, 'パイロット': 13, '芸能・モデル': 14, 'アパレル・ショップ': 16, 'アナウンサー': 17, '保育士': 18, '自由業': 19, '学生': 20, '上場企業': 21, '金融': 22, 'コンサル': 23, '調理師・栄養士': 24, '教育関連': 25, '食品関連': 26, '製菓': 27, '保険': 28, '不動産': 29, '建築関連': 30, '通信': 31, '流通': 32, 'WEB業界': 33, '接客業': 34, 'エンターテインメント': 35, 'ブライダル': 36, '福祉・介護': 37, '広告': 38, 'マスコミ': 39, '学生': 40, '医師': 41, '他': 99}
  enum holiday:     {"土日": 1, "平日": 2, "不定休": 3}
  enum income:       {"200万円未満": 1, "200万円以上~400万円未満": 2, "400万円以上~600万円未満": 3, "600万円以上~800万円未満": 4, "800万円以上~1000万円未満": 5, "1000万円以上~1500万円未満": 6, "1500万円以上~2000万円未満": 7, "2000万円以上~3000万円未満": 8, "3000万円以上": 9}
  enum school:   {"高卒": 1, "短大専門卒": 2, "大卒": 3, "院卒": 4, "在学中": 5}

  #----------------------------------------
  #  ** Scope **
  #----------------------------------------
  scope :not_me, ->(user) { where.not(user_id: user) }
  scope :like_user, ->(user) { where.not(user_id: Like.select('user_id').where(target_id: user))}
  scope :valid, -> { where.not(plan: 0)}
  scope :men, -> { where(sex: 1)}
  scope :women, -> { where(sex: 2)}
  scope :paying_users, -> { where("plan > ?", 0)}
  scope :premium, -> { where(plan: 30)}

#----------------------------------------
  def age
    date_format = "%Y%m%d"
    (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
  end

end
