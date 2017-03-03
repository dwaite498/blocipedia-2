require 'random_data'

# create wikis
10.times do
    Wiki.create!(
        title: RandomData.random_name,
        body: RandomData.random_paragraph
    )
end

User.create!(
    email: "Test@email.com",
    password: "password"
    )

wikis = Wiki.all

puts "seed finished"
puts "#{Wiki.count} wikis created"