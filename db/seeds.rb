users = ["もりもと", "うちやま", "たいき", "よしむら"]
users.each_with_index do |user, i|
  User.create(
    nickname: "#{user}",
    email: "#{i + 1}@gamil.com",
    password: "test#{i + 1}#{i + 1}"
  )
end

# addresses = ["{id: 13, name: '東京都'}", "{id: 13, name: '東京都'}", "{id: 13, name: '東京都'}", "{id: 13, name: '東京都'}"]
# addresses.each_with_index do |address, i|
#   Address.create(
#     id: "#{i + 1}",
#     postal_code: "150-6190",
#     prefecture: "#{address}",
#     city: "渋谷区",
#     street: "渋谷スクランブルスクエア",
#     user_id: "#{i + 1}"
#   )
# end
