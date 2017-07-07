class UserProfile < ActiveRecord::Base

  # 都道府県表示するgemに必要
  include JpPrefecture
  jp_prefecture :address


  belongs_to :user, inverse_of: :user_profile

  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader
  mount_uploader :identification_image, ImageUploader


  # --------------------------------------------------
  #  select候補
  # --------------------------------------------------
  SEX        = [["未設定","未設定"], ["L","l"], ["G","g"], ["B","b"], ["T","t"], ["S","s"]]

  PLAY_STYLE  = [["タチ",1], ["ネコ",2], ["リバース",3]]
  STYLE      = ['スリム','やや細め','普通','グラマー','マッチョ','ぽっちゃり','太め']
  JOB        = ['会社員','医師','弁護士','公認会計士','経営者・役員','公務員','事務員','大手商社','外資金融','大手企業','大手外資','クリエイター','IT関連','パイロット','芸能・モデル','アパレル・ショップ','アナウンサー','保育士','自由業','学生','その他','上場企業','金融','コンサル','調理師・栄養士','教育関連','食品関連','製菓','保険','不動産','建築関連','通信','流通','WEB業界','接客業','エンターテインメント','ブライダル','福祉・介護','広告','マスコミ','','']
  INCOME     = [["200万円未満",1], ["200万円以上~400万円未満",2], ["400万円以上~600万円未満",3], ["600万円以上~800万円未満",4], ["800万円以上~1000万円未満",5], ["1000万円以上~1500万円未満",6], ["1500万円以上~2000万円未満",7], ["2000万円以上~3000万円未満",8],  ["3000万円以上",9]]
  HOUSEMATE  = ['一人暮らし','友達と一緒','実家暮らし','その他']
  ALCOHOL    = [["飲む",1], ["ときどき飲む",2], ["飲まない",3]]
  SMOKE    = [["吸う",1], ["ときどき吸う",2], ["吸わない",3], ["IQOS",4]]
  PURPOSE    = [["恋人探し",1], ["友達探し",2], ["大人な関係",3], ["悩み相談",4], ["その他",5]]
  MARRIAGE    = [["独身（未婚）",1], ["独身（離婚）",2], ["独身（死別）",3], ["その他",4]]
  CHILD    = [["有り",1], ["無し",2]]

  #----------------------------------------
  #  ** Status **
  #----------------------------------------
  enum sex:     { "": 0, l: 1, g: 2, b: 3, t: 4, s: 5, o: 6 }


  #----------------------------------------
  #  ** Scope **
  #----------------------------------------
  scope :not_me, ->(user) { where.not(user_id: user) }
  scope :like_user, ->(user) { where.not(user_id: Like.select('user_id').where(target_id: user))}
  scope :valid, -> { where.not(plan: 0)}
  scope :men, -> { where(sex: 1)}
  scope :women, -> { where(sex: 2)}
  scope :paying_users, -> { where.not(plan: 1)}
  scope :premium, -> { where(plan: 30)}




  def age
    date_format = "%Y%m%d"
    (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
  end

end
