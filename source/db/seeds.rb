# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

customers = [
  [ "Johny", "Flow" ],
  [ "Raj", "Jamnis" ],
  [ "Andrew", "Chung" ],
  [ "Mike", "Smith" ]
]

customers.each do |first_name, last_name|
  Customer.create( first_name: first_name, last_name: last_name )
end

#Successful Charges
5.times do
  Charge.create(paid: true, amount: 4900, currency: "usd", refunded: false, customer_id: 1)
end 

3.times do
  Charge.create(paid: true, amount: 4900, currency: "usd", refunded: false, customer_id: 2)
end

[3,4].each do |user_id|
  Charge.create(paid: true, amount: 4900, currency: "usd", refunded: false, customer_id: user_id)
end

#Failed Charges
3.times do
  Charge.create(paid: false, amount: 4900, currency: "usd", refunded: false, customer_id: 3)
end

2.times do
  Charge.create(paid: false, amount: 4900, currency: "usd", refunded: false, customer_id: 4)
end

#Disputed Charges
3.times do
  Charge.create(paid: true, amount: 4900, currency: "usd", refunded: true, customer_id: 1)
end

2.times do
  Charge.create(paid: true, amount: 4900, currency: "usd", refunded: true, customer_id: 2)
end