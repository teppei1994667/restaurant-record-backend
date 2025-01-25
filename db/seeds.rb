stores = [
  [15, "本店", "0699999999", "大阪府大阪市天王寺区下味原町２−１８", 32, 20],
  [15, "梅田店", "0688888888", "大阪府大阪市北区曾根崎２丁目１６−２２ B1～2F ジャスミン曽根崎ビル", 32, 20]
]

stores.each do |user_id, store_name, telephone_number, address, seating_capacity, area|
  Store.create(user_id: user_id, store_name: store_name, telephone_number: telephone_number, address: address, seating_capacity: seating_capacity, area: area)
end