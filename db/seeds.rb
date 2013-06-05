require 'faker'
CATEGORIES = ["Antiques",
              "Appliances",
              "Auto parts",
              "Barter",
              "Bikes",
              "Boats",
              "Books",
              "Business",
              "Cars+Trucks",
              "CDs/DVD/VHS",
              "Cell Phones",
              "Clothes+Acc",
              "Collectibles",
              "Computer",
              "Electronics",
              "Free",
              "Furniture",
              "Garage Sale",
              "General",
              "Household",
              "Jewelry",
              "Materials",
              "Motorcycles",
              "Music Instr",
              "Photo+Video",
              "RVs",
              "Sporting",
              "Tickets",
              "Tools",
              "Video Gaming",
              "Wanted"]

CATEGORIES.each do |category|
  Category.create(name: category)
end

Category.all.each do |category|
  10.times do
    data = { email: Faker::Internet.email,
             title: Faker::Lorem.words(5).join(" ").titlecase,
             description: Faker::Lorem.paragraph(8).to_s,
             price: (1..500).to_a.sample}
    category.posts << Post.create(data)
  end
end
