# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

accel = Device.create(name: 'Accel')
['X','Y','Z'].each do |name|
  Sensors::CreateService.new({name: name, device_id: accel.id}).execute
end

mag = Device.create(name: 'Mag')
['X','Y','Z', 'R'].each do |name|
  Sensors::CreateService.new({name: name, device_id: mag.id}).execute
end
gyro = Device.create(name: 'Gyro')
['X','Y','Z'].each do |name|
  Sensors::CreateService.new({name: name, device_id: gyro.id}).execute
end

others = Device.create(name: 'Others')
['RH','Pressure','Temp', 'Light', 'Noise'].each do |name|
  Sensors::CreateService.new({name: name, device_id: others.id}).execute
end