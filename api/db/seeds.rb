# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Service.find_or_create_by!(name: 'Oil Change', interval_miles: 3000)
Service.find_or_create_by!(name: 'Brakes, Rear')
Service.find_or_create_by!(name: 'Brakes, Front')
Service.find_or_create_by!(name: 'Tire Rotation', interval_miles: 5000)
Service.find_or_create_by!(name: 'Timing Set')

customer1 = Customer.find_or_create_by!(first_name: 'Good', last_name: 'Customer', phone_number: '234-234-1234', city: 'Cleveland', state: 'OH', postal_code: '44101')
customer2 = Customer.find_or_create_by!(first_name: 'Bad', last_name: 'Customer', phone_number: '240-240-4321', city: 'Cleveland', state: 'OH', postal_code: '44101')

ford     = Make.find_or_create_by!(name: 'Ford')
chrysler = Make.find_or_create_by!(name: 'Chrysler')

f150     = Model.find_or_create_by!(name: 'F-150', make: ford)
pacifica = Model.find_or_create_by!(name: 'Pacifica', make: chrysler)

f150fx   = SubModel.find_or_create_by!(name: 'FX4', model: f150)

Vehicle.find_or_create_by!(name: 'Whitey Ford', miles: 180500, make: ford, model: f150, sub_model: f150fx, color: 'White', year: 2010, customer: customer1) 
Vehicle.find_or_create_by!(name: 'Minivan', make: chrysler, model: pacifica, miles: 55100, color: 'Blue', year: 2018, customer: customer1) 

user = User.find_or_initialize_by(email: 'thomas@localhost.localdomain') do |user|
  user.skip_confirmation!
  user.password = 'tommyboy'
  user.password_confirmation ='tommyboy'
 
  user.save!
end
