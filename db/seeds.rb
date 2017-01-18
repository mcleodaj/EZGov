# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require 'open-uri'
require 'json'

CSV.foreach(Rails.root.join('public', 'states.csv')) do |row|
  State.create!( :name => row[0],
                  :abbr  => row[1])
end



site = open("https://www.govtrack.us/api/v2/role?current=true&limit=800")
puts "people in progress"
persons = site.read
puts " people read"
persons_parsed = JSON.parse(persons)
puts "people parsed"
persons_parsed["objects"].each do |person|
  if person["role_type"]=="senator" || person["role_type"]=="representative"
    if state = State.find_by(abbr: person["state"])
      id = state.id
      Person.create(
      :firstname => person["person"]["firstname"],
      :lastname => person["person"]["lastname"],
      :gender => person["person"]["gender"],
      :party => person["party"],
      :description => person["description"],
      :role_type => person["role_type"],
      :address => person["extra"]["address"],
      :contact => person["extra"]["contact_form"],
      :phone => person["phone"],
      :website => person["website"],
      :identification => person["person"]["id"],
      :state_id => id
      )
    end
  end
end
puts "people seeded"

site = open("https://www.govtrack.us/api/v2/bill?congress=114&order_by=-current_status_date&limit=200")
response = site.read
bills_parsed = JSON.parse(response)
puts "bills starting"
bills_parsed["objects"].each do |bill|
  if person = Person.find_by(identification: bill["sponsor"]["id"])
    id = person.id
  else
    id = nil
  end
  Bill.create(
  :name => bill["title"],
  :full_bill => "#{bill['link']}/text",
  :bill_type => bill["bill_type"],
  :is_alive => bill["is_alive"],
  :is_current => bill["is_current"],
  :current_status => bill["current_status"],
  :current_status_date => bill["current_status_date"],
  :introduced_date => bill["introduced_date"],
  :identification => bill["id"],
  :sponsor_id => id
  )
end
puts "bills parsed"

puts "votes starting"
Person.all.each do |person|
  site = open("https://www.govtrack.us/api/v2/vote_voter/?person=#{person.identification}&limit=200&order_by=-created&fields=vote__id,created,option__value,vote__category,vote__chamber,vote__question,vote__number,vote__related_bill")
  response = site.read
  votes_parsed = JSON.parse(response)
  votes_parsed["objects"].each do |vote|
    if vote["vote"]["related_bill"] != nil
      if bill = Bill.find_by(identification: vote["vote"]["related_bill"])
        Vote.create(
        :vote => vote["option"]["value"],
        :vote_type => vote["vote"]["category"],
        :vote_chamber => vote["vote"]["chamber"],
        :question => vote["vote"]["question"],
        :vote_date => vote["created"],
        :person_id => person.id,
        :bill_id => bill.id
        )
      end
    end
  end
end
puts "votes parsed"
