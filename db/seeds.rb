require 'faker'
# emptying database
puts 'Deleting existing instances'

Animal.destroy_all
User.destroy_all

# User seeds
puts 'Seeding users'

user1 = User.new
user1.email = 'ivan@email.com'
user1.password = 'password'
user1.save

user2 = User.new
user2.email = 'brandon@email.com'
user2.password = 'password'
user2.save

user3 = User.new
user3.email = 'john@email.com'
user3.password = 'password'
user3.save

user4 = User.new
user4.email = 'kathrin@email.com'
user4.password = 'password'
user4.save

users = [user1, user2, user3, user4]

# Animal seeds
puts 'Seeding animals'

15.times do
  animal = Animal.new(
    name: Faker::Creature::Dog.name,
    species: Faker::Creature::Animal.name,
    age: Faker::Number.between(from: 1, to: 30),
    description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere provident molestiae nemo est ad unde quia vero, quos iure voluptatum labore quis magni iste, dolorum error voluptas, dolores commodi temporibus!',
    gender: Animal::GENDERS.sample,
    category: Animal::CATEGORIES.sample,
    place_of_origin: Faker::Address.country,
    daily_rate: Faker::Number.between(from: 10, to: 100),
    photos: [],
    user: users.sample)
  3.times do
    random_image_url = "https://loremflickr.com/500/350/#{animal.species.gsub(" ", "_")}"
    file = URI.open(random_image_url)
    animal.photos.attach(io: file, filename: "animal#{animal.name}#{animal.species}.jpg", content_type: 'image/jpg')
  end
  animal.save
end
