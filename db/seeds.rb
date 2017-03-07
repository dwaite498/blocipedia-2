require 'random_data'


User.create!(
    email: "Test@email.com",
    password: "password",
    role: 'user'
    )

10.times do
    User.create!(
    email: RandomData.random_email,
    password: 'password'
    )
end

User.create!(
    email: 'dhammer@blocipedia.com',
    password: 'password',
    role: 'admin'
    )
users = User.all

# create wikis
10.times do
    Wiki.create!(
        title: RandomData.random_name,
        body: RandomData.random_paragraph,
        user: users.sample,
        private: false
    )
end


wikis = Wiki.all
puts "seed finished"
puts "#{User.first.email} user created"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"