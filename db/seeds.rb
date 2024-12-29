stores = [
  [15, "テスト店", "0699999999", "大阪市西区立売堀6-6-6 朝日プラザ長堀西", 32, 20]
]

stores.each do |user_id, store_name, telephone_number, address, seating_capacity, area|
  Store.create(user_id: user_id, store_name: store_name, telephone_number: telephone_number, address: address, seating_capacity: seating_capacity, area: area)
end