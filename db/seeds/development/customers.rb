
10.times do |idx|
  Customer.create(
    last_name: "test#{idx}",
    first_name: "test#{idx}",
    last_name_kana:  "カナ",
    first_name_kana:  "カナ",
    email: "test#{idx}@example.com",
    postal_code: 1111111,
    address: "test#{idx}県●●市●●町1番地",
    phone_number: "08011111111",
    password: "nagano",
    password_confirmation: "nagano"
  )

end