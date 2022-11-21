require 'csv'
require 'faker'

Soap.destroy_all
Category.destroy_all

csv_file = Rails.root.join('db/soaps.csv')
csv_data = File.read(csv_file)

soaps = CSV.parse(csv_data, headers: true)

soaps.each do |data|
  category = Category.find_or_create_by(name: data["category"])

  if category && category.valid?
    soaps = category.soaps.create(
      name: data["name"],
      price: data["price"],
      weight: Faker::Number.decimal(l_digits: 1, r_digits: 1),
      stock: data["stock"]
    )
    puts "Invalid soap #{data["name"]}" unless soaps&.valid?
  else
    puts "Invalid category #{data['category']} for soap: #{data["name"]}"
  end
end