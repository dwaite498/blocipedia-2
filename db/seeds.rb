require 'random_data'


User.create!(
    email: "Test@email.com",
    password: "password",
    role: 'admin'
    )

# 10.times do
#     User.create!(
#     email: RandomData.random_email,
#     password: 'password'
#     )
# end

User.create!(
    email: 'test2@email.com',
    password: 'password',
    role: 'premium'
    )
    
User.create!(
    email: 'test3@email.com',
    password: 'password',
    role: 'user'
    )
users = User.all

Wiki.create!(
        title: 'first wiki',
        body: RandomData.random_paragraph,
        user: users.sample,
        private: [true, false].sample
    )
    
Wiki.create!(
        title: 'second wiki',
        body: RandomData.random_paragraph,
        user: users.sample,
        private: [true, false].sample
    )

Wiki.create!(
  title: "My Very First Post",
  body:
  %Q{### There Is Something You Should Know!

  This is my very first post using markdown!

  How do you like it?  I learned this from [RichOnRails.com](http://richonrails.com/articles/rendering-markdown-with-redcarpet)!},
  user: users.sample,
  private: false
)
# create wikis
10.times do
    Wiki.create!(
        title: RandomData.random_name,
        body: RandomData.random_paragraph,
        user: users.sample,
        private: [true, false].sample
    )
end


wikis = Wiki.all
puts "seed finished"
puts "#{User.first.email} user created"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"