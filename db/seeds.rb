# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Vessel.destroy_all
Company.destroy_all
binding.pry
pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
mmt = Company.create!(name: 'Major Marine Tours', tripadvisor_rank: 2, offering_cruises: false)

# pct.vessels.create!(name: 'Klondike Express', year_built: 1999, operation: true)
# pct.vessels.create!(name: 'Glaicer Quest', year_built: 1987, operation: false)

# mmt.vessels.create!(name: 'Kenai Star', year_built: 1987, operation: true)
# mmt.vessels.create!(name: 'Fairweather Express 2', year_built: 2001, operation: true)