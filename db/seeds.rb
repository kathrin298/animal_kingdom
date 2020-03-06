require 'faker'
require 'open-uri'
# emptying database

# Add some !'s' to .create() for error outputting

puts 'Deleting existing instances'

Review.destroy_all
Booking.destroy_all
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

30.times do
  begin
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
    2.times do
      random_image_url = "https://loremflickr.com/500/350/#{animal.species.gsub(" ", "_")}"
      file = URI.open(random_image_url)
      animal.photos.attach(io: file, filename: "animal#{animal.name}#{animal.species}.jpg", content_type: 'image/jpg')
    end
    animal.save
    puts "created an animal"
  rescue
    puts "Failed animal"
    retry
  else

  end
end
puts "created #{Animal.all.size} animals"


# Okay, now let's seed a few bookings with reviews
puts "Seeding bookings and reviews..."
100.times do

  m = rand(1..7)
  sd = rand(1..15)
  ed = sd + rand(1..15)
  st = Date.new(2020,m,sd)
  ed = Date.new(2020,m,ed)

  user_this_booking = users.sample
  animal = Animal.all.sample

  booking = Booking.new(delivery_address: Faker::Address.full_address,
                        delivery_included: true, start_date: st,
                        end_date: ed)
  booking.animal = animal
  booking.user = user_this_booking

  duration = (ed - st).to_i
  booking.total_fee = (animal.daily_rate * duration).round(2)

  review = Review.new(title: Faker::GreekPhilosophers.quote,
                      content: Faker::TvShows::RickAndMorty.quote,
                      rating: rand(2..5))
  review.booking = booking
  review.user = user_this_booking
  review.save

end
