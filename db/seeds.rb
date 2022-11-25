require 'csv'
require 'faker'

AdminUser.destroy_all
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
      stock: data["stock"],
      description: Faker::Quote.famous_last_words
    )
    # query = URI.encode_www_form_component([data["name"] + "soap", data["category"]].join(","))
    # downloaded_image = URI.open("https://source.unsplash.com/500x500/?#{​query}​​")
    # soaps.image.attach(io: downloaded_image,
    #                    filename: "m-#{[data["name"], data["category"]].join('-')}.jpg")
    # sleep(1)
    puts "Invalid soap #{data["name"]}" unless soaps&.valid?
  else
    puts "Invalid category #{data['category']} for soap: #{data["name"]}"
  end
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?