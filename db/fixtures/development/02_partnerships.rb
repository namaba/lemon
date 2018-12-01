2.upto(20) do |i|
  Partnership.seed(:id) do |p|
    p.user_id = 1
    p.target_id = i
    p.status = 1
  end
end