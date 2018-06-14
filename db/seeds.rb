User.create!(name:  "Ahmed Mohamed Fouad",
             email: "ahmedfouad2020era@gmail.com",
             password:              "12345678",
             password_confirmation: "12345678",
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Ahmed Fouad",
             email: "elta3lab50cent@gmail.com",
             password:              "12345678",
             password_confirmation: "12345678",
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
endAdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?