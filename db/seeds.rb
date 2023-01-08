# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Tag.create([
#   { name: 'Black' },
#   { name: 'Grey' },
#   { name: 'White' },
#   { name: 'Red' },
#   { name: 'Blue' },
#   { name: 'Green' },
#   { name: 'Yellow' },
#   { name: 'Purple' },
#   { name: 'Orange' }
# ])

# TagSecond.create([
#   { name: 'Black' },
#   { name: 'Grey' },
#   { name: 'White' },
#   { name: 'Red' },
#   { name: 'Blue' },
#   { name: 'Green' },
#   { name: 'Yellow' },
#   { name: 'Purple' },
#   { name: 'Orange' }
# ])

# User.create(
#   name: 'issei',
#   email: Rails.application.credentials.admin_user[:email],
#   password: Rails.application.credentials.admin_user[:password],
#   password_confirmation: Rails.application.credentials.admin_user[:password],
#   role: :admin
# )

Tag.create([
  { name: 'Pink' },
  { name: 'Brown' },
  { name: 'Beige' }
])

TagSecond.create([
  { name: 'Pink' },
  { name: 'Brown' },
  { name: 'Beige' }
])