User.create!(name: "admin", email: "ribon.program@gmail.com", password: "pp0sxacv")

events = ["妊娠", "出産", "育児"]

events.each do |event|
  Event.create!(name: event)
end

places = ["役所", "医療機関", "会社"]

places.each do |place|
  Place.create!(name: place)
end
