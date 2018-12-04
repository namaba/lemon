Partnership.all.each do |p|
  UserPartnership.seed(:id) do |up|
    up.user_id = p.user_id
    up.partnership_id = p.id
    up.status = 1
  end
  UserPartnership.seed(:id) do |up|
    up.user_id = p.target_id
    up.partnership_id = p.id
    up.status = 1
  end
end