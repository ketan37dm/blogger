# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |i|
  u = User.create(name: "User_#{i}")
  10.times do |j|
    Post.create(user: u, title: "Title #{i}#{j}", content: "Content #{i}#{j}")
  end
end

Post.all.each do |post|
  10.times do
    user = User.all.sample
    Comment.create(post: post, user: user, content: "Comment for Post #{post.id} by User #{user.id}")
  end
end

puts "Users created - #{User.count}"
puts "Posts created - #{Post.count}"
puts "Comments created - #{Comment.count  }"
