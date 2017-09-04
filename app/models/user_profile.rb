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
  SEX         = [["未設定",0], ["L",1], ["G",2], ["B",3], ["T",4], ["S",5]]
  PLAY_STYLE  = [["タチ",1], ["ネコ",2], ["リバース",3]]
  STYLE       = [["スリム",1], ["スレンダー",2],["細マッチョ",3], ["普通",4], ["マッチョ",5], ["グラマー",6], ["ややぽっちゃり",7], ["ぽっちゃり",7], ["太め",7]]
  JOB         = ['会社員',0], ['医師',1], ['弁護士',2], ['公認会計士',3], ['経営者・役員',4], ['公務員',5], ['事務員',6], ['大手商社',7], ['外資金融',8], ['大手企業',9], ['大手外資',10], ['クリエイター',11], ['IT関連',12], ['パイロット',13], ['芸能・モデル',14], ['アパレル・ショップ',16], ['アナウンサー',17], ['保育士',18], ['自由業',19], ['学生',20], ['上場企業',21], ['金融',22], ['コンサル',23], ['調理師・栄養士',24], ['教育関連',25], ['食品関連',26], ['製菓',27], ['保険',28], ['不動産',29], ['建築関連',30], ['通信',31], ['流通',32], ['WEB業界',33], ['接客業',34], ['エンターテインメント',35], ['ブライダル',36], ['福祉・介護',37], ['広告',38], ['マスコミ',39], ['学生',40], ['その他',99]
  INCOME      = [["200万円未満",1], ["200万円以上~400万円未満",2], ["400万円以上~600万円未満",3], ["600万円以上~800万円未満",4], ["800万円以上~1000万円未満",5], ["1000万円以上~1500万円未満",6], ["1500万円以上~2000万円未満",7], ["2000万円以上~3000万円未満",8],  ["3000万円以上",9]]
  HOUSEMATE   = ['一人暮らし',1], ['友達と一緒',2], ['実家暮らし',3], ['その他',99]
  ALCOHOL     = [["飲む",1], ["ときどき飲む",2], ["飲まない",3]]
  SMOKE       = [["吸う",1], ["飲む時だけ吸う",2], ["禁煙者と一緒の時は吸わない",3], ["相手次第でやめる気でいる",4], ["電子タバコ",5], ["吸わない",6]]
  PURPOSE     = [["恋人探し",1], ["友達探し",2], ["大人な関係",3], ["悩み相談",4], ["その他",99]]
  MARRIAGE    = [["独身（未婚）",1], ["独身（離婚）",2], ["独身（死別）",3], ["その他",99]]
  CHILD       = [["無し",1], ["同居中",2], ["別居中",3]]

  MARRIAGE    = [["独身（未婚）",1], ["独身（離婚）",2], ["独身（死別）",3], ["その他",99]]


  # == 下記追加カラム
  # 性格
  PERSONALITY = [["明るい"], ["クール"], ["優しい"], ["素直"], ["天邪鬼"], ["奔放"], ["親しみやすい"], ["見た目とのギャップが有る"], ["インドア",], ["アウトドア"], ["楽観的"], ["誠実"], ["几帳面"], ["いつも笑顔"], ["落ち着いてる"], ["子供っぽい"], ["思いやりがある"], ["寂しがりや"], ["社交的"], ["甘えんぼう"], ["照れ屋"], ["好奇心旺盛"], ["家庭的"], ["仕事好き"], ["話し上手"], ["聞き上手"], ["さわやか"], ["ワイルド"], ["天然"], ["負けず嫌い"], ["おっとりしてる"], ["気が利く"], ["マメ"], ["大胆"], ["気前がいい"], ["マイペース"], ["奥手"], ["気分屋"]]
  # チャームポイント
  CHARMPOINT  = [["目"], ["キレイな髪"], ["高い鼻筋"], ["美白"], ["小麦色の肌"], ["小顔"], ["白い歯"], ["八重歯"], ["アヒル口"], ["笑顔"], ["キリッとした顔"], ["童顔"], ["声"], ["鎖骨"], ["うなじ"], ["手"], ["細い腕"], ["長い足"], ["ウエスト"], ["引き締まった身体"], ["筋肉"], ["その他"]]
  # 社交性
  SOCIABILITY = [["大人数が好き"], ["少人数が好き"], ["一人が好き"], ["すぐに仲良くなる"], ["徐々に仲良くなる"], ["人見知り"]]
  # 趣味・好きなこと
  HOBBY       = [["邦楽"], ["洋楽"], ["クラシック"], ["ライブ"], ["クラブ"], ["楽器"], ["ダンス"], ["映画"], ["ドラマ"], ["海外ドラマ"], ["アニメ"], ["マンガ"], ["読書"], ["お笑い"], ["アイドル"], ["ゲーム"], ["インターネット"], ["スポーツ観戦"], ["野球"], ["サッカー"], ["ラグビー"], ["ゴルフ"], ["マリンスポーツ"], ["釣り"], ["スキー"], ["スノボー"], ["BBQ"], ["アウトドア"], ["登山"], ["ミリタリー"], ["サイクリング"], ["バイク"], ["ドライブ"], ["散歩"], ["エクササイズ"], ["ジム"], ["スパ"], ["ヨガ"], ["美術"], ["芸術"], ["英会話"], ["旅行"], ["温泉"], ["ペット"], ["ショッピング"], ["ワイン"], ["焼酎"], ["ビール"], ["カクテル"], ["料理"], ["焼肉"], ["寿司"], ["ラーメン"], ["鍋"], ["イタリアン"], ["フレンチ"], ["和食"], ["中華"], ["スイーツ"], ["ファッション"], ["麻雀"], ["パチンコ"], ["パチスロ"], ["カジノ"], ["占い"], ["その他"]]
  # 休日
  HOLIDAY = [["土日",1], ["平日",2], ["不定休",3], ["その他",4]]
  # 結婚願望
  WANT_TO_MARRIAGE = [["すぐにでもしたい",1], ["2~3年のうちにしたい",2], ["いい人がいればしたい",3], ["今のところ考えてない",4], ["わからない",5]]
  # 相手への重視項目
  CONDITION = [["年齢"], ["写真の印象"], ["経済力"], ["人柄"], ["価値観"], ["恋愛の真剣度"]]
  # 出会うまでの希望
  TO_MEET = [["すぐ会いたい",1], ["フィーリング次第",2], ["トークしてから",3]]
  # 血液型
  BLOOD_TYPE = [["A型",1], ["B型",2], ["O型",3], ["AB型",4], ["わからない",5]]
  # 学歴
  SCHOOL = [["高卒",1], ["短大専門卒",2], ["大卒",3], ["院卒",4], ["在学中",5], ["その他",99]]
  # 兄弟姉妹
  BRO_SIS = [["一人っ子",1], ["長男/長女",2], ["次男/次女",3], ["三男/三女",4], ["末っ子",5], ["その他",99]]

  #----------------------------------------
  #  ** Status **
  #----------------------------------------

  # enum sex:     { "": 0, l: 1, g: 2, b: 3, t: 4, s: 5, o: 6 }
  # enum plan:    { normal: 0, one_month: 1, three_month: 3, six_month: 6, year: 12, premium: 30 }

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
#  ** Array **
#----------------------------------------
def hobby=(value)
  str = ''
  value.each do |val|
    str += val.to_s + ','
  end

  rslt = str.empty? ? nil : (',' + str)

  write_attribute(:hobby, rslt)
end

def hobby
  read_attribute(:hobby).to_s.split(';')
end
#----------------------------------------
def personality=(value)
  str = ''
  value.each do |val|
    str += val.to_s + ','
  end

  rslt = str.empty? ? nil : (',' + str)

  write_attribute(:personality, rslt)
end

def personality
  read_attribute(:personality).to_s.split(';')
end
#----------------------------------------
def charmpoint=(value)
  str = ''
  value.each do |val|
    str += val.to_s + ','
  end

  rslt = str.empty? ? nil : (',' + str)

  write_attribute(:charmpoint, rslt)
end

def charmpoint
  read_attribute(:charmpoint).to_s.split(';')
end
#----------------------------------------
def sociability=(value)
  str = ''
  value.each do |val|
    str += val.to_s + ','
  end

  rslt = str.empty? ? nil : (',' + str)

  write_attribute(:sociability, rslt)
end

def sociability
  read_attribute(:sociability).to_s.split(';')
end
#----------------------------------------
def condition=(value)
  str = ''
  value.each do |val|
    str += val.to_s + ','
  end

  rslt = str.empty? ? nil : (',' + str)

  write_attribute(:condition, rslt)
end

def condition
  read_attribute(:condition).to_s.split(';')
end
#----------------------------------------
  def age
    date_format = "%Y%m%d"
    (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
  end

end
