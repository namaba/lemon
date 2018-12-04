# マッチ済み
2.upto(10) do |i|
  Like.seed(:id) do |l|
    l.user_id = 1
    l.target_id = i
    l.like = 1
    l.is_liked = 1
    l.status = 1
  end
end

# マッチ済み
11.upto(20) do |i|
  Like.seed(:id) do |l|
    l.user_id = i
    l.target_id = 1
    l.like = 1
    l.is_liked = 1
    l.status = 1
  end
end

# 未マッチ
21.upto(30) do |i|
  Like.seed(:id) do |l|
    l.user_id = 1
    l.target_id = i
    l.like = 1
    l.is_liked = 0
    l.status = 0
  end
end

# 未マッチ
31.upto(40) do |i|
  Like.seed(:id) do |l|
    l.user_id = i
    l.target_id = 1
    l.like = 1
    l.is_liked = 0
    l.status = 0
  end
end


