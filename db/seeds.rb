require 'csv'
require 'faker'

AdminUser.destroy_all
Soap.destroy_all
Category.destroy_all
OrderDetail.destroy_all
Order.destroy_all
User.destroy_all
Province.destroy_all

#CSV file with all the soap products
csv_file = Rails.root.join('db/soaps.csv')
csv_data = File.read(csv_file)

soaps = CSV.parse(csv_data, headers: true)

soaps.each do |data|
  category = Category.find_or_create_by(name: data["category"])

  if category && category.valid?
    new_soaps = category.soaps.create(
      name: data["name"],
      price: data["price"],
      weight: Faker::Number.decimal(l_digits: 1, r_digits: 1),
      stock: data["stock"],
      description: Faker::Quote.famous_last_words
    )
    query = URI.encode_www_form_component(data["name"] + "soap")
    downloaded_image = URI.open("https://source.unsplash.com/500x500/?#{query}")
    new_soaps.image.attach(io: downloaded_image, filename: "m-#{data["name"]}.jpg")
    sleep(1)
    puts "Invalid soap #{data["name"]}" unless new_soaps&.valid?
  else
    puts "Invalid category #{data['category']} for soap: #{data["name"]}"
  end
end

# Loop through the rows of province CSV file.
second_csv_file = Rails.root.join('db/province_tax.csv')
second_csv_data = File.read(second_csv_file)

provinces = CSV.parse(second_csv_data, headers: true)

provinces.each do |province|
  new_province = Province.find_or_create_by(name: province["Province"])
  new_province.PST = province["PST"]
  new_province.GST = province["GST"]
  new_province.HST = province["HST"]
  new_province.save!
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?