# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Vessel.destroy_all
Company.destroy_all

@pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
@mmt = Company.create!(name: 'Major Marine Tours', tripadvisor_rank: 2, offering_cruises: false)

@pct.vessels.create!(name: 'Glaicer Quest', length: 97, year_built: 1987, operational: false)
@pct.vessels.create!(name: 'Klondike Express', length: 137, year_built: 1999, operational: true)
@pct.vessels.create!(name: 'Bravest', length: 130, year_built: 1997, operational: true)

@mmt.vessels.create!(name: 'Kenai Star', length: 90, year_built: 1987, operational: true)
@mmt.vessels.create!(name: 'Fairweather Express 2', length: 110, year_built: 2001, operational: false)