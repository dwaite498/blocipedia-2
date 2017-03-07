require 'random_data'

# create wikis
10.times do
    Wiki.create!(
        title: RandomData.random_name,
        body: RandomData.random_paragraph,
        private: false
    )
end

User.create!(
    email: "Test@email.com",
    password: "password",
    role: "admin"
    )
    
User.create!(
    email: "dhammer@email.com",
    password: 'password',
    )

wikis = Wiki.all
puts "seed finished"
puts "#{User.first.email} user created"
puts "#{Wiki.count} wikis created"