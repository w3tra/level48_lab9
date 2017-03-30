def copy_image_fixture(file_name, id)
  dir = Rails.root.join('public', 'uploads')
  Dir.mkdir(dir) unless File.directory?(dir)
  FileUtils.cp(file_name, dir.join(id.to_s))
end

cpus_category = Category.create(name: 'CPUs')
motherboards_category = Category.create(name: 'Motherboards')
ram_category = Category.create(name: 'RAM')
hdd_category = Category.create(name: 'HDDs')

fixtures_category = Category.create(name: 'Fixtures')

fixtures_path = Rails.root.join('app', 'assets', 'images', 'fixtures')

cpu = Product.create(title: 'Intel Core i7', price: 300, description: Faker::Lorem.paragraph, category: cpus_category)
copy_image_fixture(fixtures_path.join('cpu.jpg'), cpu.id)

ram = Product.create(title: '4GB DDR3 RAM', price: 40, description: Faker::Lorem.paragraph, category: ram_category)
copy_image_fixture(fixtures_path.join('ram.jpg'), ram.id)

hdd = Product.create(title: '1TB Seagate HDD', price: 60, description: Faker::Lorem.paragraph, category: hdd_category)
copy_image_fixture(fixtures_path.join('hdd.jpg'), hdd.id)

mb = Product.create(title: 'Asus P5Q3', price: 120, description: Faker::Lorem.paragraph, category: motherboards_category)
copy_image_fixture(fixtures_path.join('mb.jpg'), mb.id)

50.times do
  Product.create(title: Faker::Commerce.product_name,
                 price: Faker::Commerce.price,
                 description: Faker::Lorem.paragraph,
                 category: fixtures_category)
end

user = User.create(name: 'John Doe', email: 'johndoe@example.com', password: '12345678', password_confirmation: '12345678')
admin_user = User.create(name: 'Admin', email: 'admin@example.com', password: 'adminadmin', password_confirmation: 'adminadmin', admin: true)