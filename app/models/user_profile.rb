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
  enum sex:   {"未選択": 1, "L": 2, "G": 3, "B": 4, "T": 5, "S": 6}, _prefix: true
  enum play_style:   {"未選択": 1, "タチ": 2, "ネコ": 3, "リバース": 4}, _prefix: true
  enum blood_type:   {"未選択": 1, "A型": 2, "B型": 3, "O型": 4, "AB型": 5, "わからない": 6}, _prefix: true
  enum bro_sis:   {"未選択": 1, "一人っ子": 2, "長男/長女": 3, "次男/次女": 4, "三男/三女": 5, "末っ子": 6}, _prefix: true
  enum housemate:   {"未選択": 1, '一人暮らし': 2, '友達と一緒': 3, '実家暮らし': 4, 'その他': 99}, _prefix: true
  enum style:       {"未選択": 1, "スリム": 2, "スレンダー": 3, "細マッチョ": 4, "普通": 5, "マッチョ": 6, "グラマー": 7, "ややぽっちゃり": 8, "ぽっちゃり": 9, "太め": 10}, _prefix: true
  enum purpose:     {"未選択": 1, "恋人探し": 2, "友達探し": 3, "悩み相談": 4, "秘密": 99}, _prefix: true
  enum alcohol:     {"未選択": 1, "飲む": 2, "ときどき飲む": 3, "飲まない": 4}, _prefix: true
  enum smoke:       {"未選択": 1, "吸う": 2, "飲む時だけ吸う": 3, "禁煙者と一緒の時は吸わない": 4, "相手次第でやめる気でいる": 5, "電子タバコ": 6, "吸わない": 7}, _prefix: true
  enum child:       {"未選択": 1, "無し": 2, "同居中": 3, "別居中": 4}, _prefix: true
  enum to_meet:     {"未選択": 1, "すぐ会いたい": 2, "フィーリング次第": 3, "トークしてから": 4, "会わない": 5}, _prefix: true
  enum marriage:    {"未選択": 1, "独身（未婚）": 2, "独身（離婚）": 3, "独身（死別）": 4, "既婚": 5}, _prefix: true
  enum job:         {"未選択": 0,'会社員': 1, '弁護士': 2, '公認会計士': 3, '経営者・役員': 4, '公務員': 5, '事務員': 6, '大手商社': 7, '外資金融': 8, '大手企業': 9, '大手外資': 10, 'クリエイター': 11, 'IT関連': 12, 'パイロット': 13, '芸能・モデル': 14, 'アパレル・ショップ': 16, 'アナウンサー': 17, '保育士': 18, '自由業': 19, '学生': 20, '上場企業': 21, '金融': 22, 'コンサル': 23, '調理師・栄養士': 24, '教育関連': 25, '食品関連': 26, '製菓': 27, '保険': 28, '不動産': 29, '建築関連': 30, '通信': 31, '流通': 32, 'WEB業界': 33, '接客業': 34, 'エンターテインメント': 35, 'ブライダル': 36, '福祉・介護': 37, '広告': 38, 'マスコミ': 39, '学生': 40, '医師': 41, '他': 99}, _prefix: true
  enum holiday:     {"未選択": 1, "土日": 2, "平日":  3, "不定休": 4}, _prefix: true
  enum income:       {"未選択": 1, "200万円未満": 2, "200万円以上~400万円未満": 3, "400万円以上~600万円未満": 4, "600万円以上~800万円未満": 5, "800万円以上~1000万円未満": 6, "1000万円以上~1500万円未満": 7, "1500万円以上~2000万円未満": 8, "2000万円以上~3000万円未満": 9, "3000万円以上": 10}, _prefix: true
  enum school:   {"未選択": 1, "高卒": 2, "短大専門卒": 3, "大卒": 4, "院卒": 5, "在学中": 6}, _prefix: true

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
