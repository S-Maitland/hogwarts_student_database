require('pry')
require_relative('../models/student.rb')
require_relative('../models/house.rb')


house1 = House.new({
  'house_name' => 'Gyrffindor',
  'logo' => 'https://cdn.shopify.com/s/files/1/2597/5112/products/hptvtgryat_1_1200x1200.jpg?v=1517443538'
  })
house1.save()

house2 = House.new({
  'house_name' => 'Ravenclaw',
  'logo' => 'https://vignette.wikia.nocookie.net/harry-potter/images/e/e5/Ravenclaw.jpeg/revision/latest?cb=20100727160324'
  })
house2.save()

house3 = House.new({
  'house_name' => 'Hufflepuff',
  'logo' => 'https://cdn.shopify.com/s/files/1/1541/8579/products/BannerFlag-Hufflepuff-HarryPotter-Product-_2-4895205600164.jpg?v=1520333934'
  })
house3.save()

house4 = House.new({
  'house_name' => 'Slytherin',
  'logo' => 'https://cdn-images-1.medium.com/max/1200/1*SJNP9OxKrXhjkO7Xi20zKg.jpeg'
  })
house4.save()






student1 =Student.new({
  'first_name' => 'Harry',
  'second_name' => 'Potter',
  'house_id' => "#{house1.id}",
  'age' => '12'
  })
student1.save()

student2 =Student.new({
  'first_name' => 'Luna',
  'second_name' => 'Lovegood',
  'house_id' => "#{house2.id}",
  'age' => '12'
  })
student2.save()

student3 =Student.new({
  'first_name' => 'Cedric',
  'second_name' => 'Diggory',
  'house_id' => "#{house3.id}",
  'age' => '14'
  })
student3.save()

student4 =Student.new({
  'first_name' => 'Draco',
  'second_name' => 'Malfoy',
  'house_id' => "#{house4.id}",
  'age' => '12'
  })
  student4.save()


binding.pry
nil
