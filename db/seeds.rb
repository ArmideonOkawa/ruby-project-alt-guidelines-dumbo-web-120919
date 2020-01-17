require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

#User.destroy_all
#District.destroy_all
locations = ['Brooklyn', 'Queens', 'Manhatten', 'The Bronx', 'Staten Island']
hunters = ["Jessica", "Annie", "Angelo", "Thomas", "Radouane", "Joel", "Shaquille", "Alison", "Summer", 
            "Kevin", "Sean", "David", "Elizabeth", "Jeremy", "Isaac", "Monsur"]


puts "Seeding districts..."
5.times do 
    District.create(location: locations.sample)

end

puts "Seeding users..."
hunters.each do |hunter|
  # create a new Player for each student in the students array
  User.create(
    name: hunter
    bankroll: 0
  )
end

puts "Seeding bounties..." 
5.times do
    user = User.all.sample

    district = District.all.sample


    Bounty.create(user_id: user.id, 
                  district_id: district.id, 
                  offense: 'Assault', 
                  classification: 'Felony', 
                  code: rand(120..121), 
                  value: rand(5000..10000),
                  completed: false)
end

5.times do
    user = User.all.sample

    district = District.all.sample
    Bounty.create(user_id: user.id, 
                  district_id: district.id, 
                  offense: 'Arson', 
                  classification: 'Felony', 
                  code: rand(120..121), 
                  value: rand(4500..5400),
                  completed: false)
end

5.times do
    user = User.all.sample

    district = District.all.sample
    Bounty.create(user_id: user.id, 
                  district_id: district.id, 
                  offense: 'Petty Larceny', 
                  classification: 'Misdemeanor', 
                  code: rand(110..116), 
                  value: rand(500..1500),
                  completed: false
    )
end

5.times do
    user = User.all.sample

    district = District.all.sample
    Bounty.create(user_id: user.id, 
                  district_id: district.id, 
                  offense: 'Disordely Conduct', 
                  classification: 'Misdemeanor', 
                  code: rand(120..121), 
                  value: 1000.00,
                  completed: false)
end

5.times do
    user = User.all.sample

    district = District.all.sample
    Bounty.create(user_id: user.id, 
                  district_id: district.id, 
                  offense: 'Loitering', 
                  classification: 'Violation', 
                  code: rand(120.05..120.10), 
                  value: 100.00,
                  completed: false)
end

