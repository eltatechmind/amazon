#States.create!(order_state: "Order")
#States.create!(order_state: "Cart")
#States.create!(order_state: "Order_cancelled")
#States.create!(order_state: "Order_completed")


User.create!(name:  "Ahmed Mohamed Fouad",
             email: "ahmedfouad2020era@gmail.com",
             password:              "12345678",
             password_confirmation: "12345678",
             gender: "male",
             birthday: "1960-08-04",
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Ahmed Fouad",
             email: "elta3lab50cent@gmail.com",
             password:              "12345678",
             password_confirmation: "12345678",
             gender: "male",
             birthday: "1960-08-04",
             activated: true,
             activated_at: Time.zone.now)

Category.create!(name: "Electronics")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               gender: "male",
               birthday: "1960-08-04",
               activated: true,
               activated_at: Time.zone.now)
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?