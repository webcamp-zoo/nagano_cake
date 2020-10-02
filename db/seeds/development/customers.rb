10.times do |idx|
    Customer.create(
        first_name: test[idx],
        last_name: test[idx],
      email: "#{test[idx]}@example.com",
      password: "bookers",
      password_confirmation: "bookers"
    )
end