GcBranch.destroy_all
Product.destroy_all
Musician.destroy_all
RepairShop.destroy_all
ProductExchange.destroy_all
RepairRequest.destroy_all

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 1. branches

5.times do
    GcBranch.create(
        city: ["Dallas", "Houston", "Austin", "San Antonio"].sample,
        company_bank_acct: (20000..40000).to_a.sample
    )
end

# 2. products

50.times do
    pr = Product.create(
        gc_branch: GcBranch.all.sample,
        product_type: ["Instrument", "Miscellaneous", "Service"].sample,
        brand: ["Yamaha", "Bach", "Fender", "Gibson", "King", "Pearl", "Adams", "Conn"].sample,
        serial: (10000000...100000000).to_a.sample,
        purchase_cost: (100..5000).to_a.sample,
        available?: true,
        rentable?: [true, false].sample,
        rate_for_rental: (20..50).to_a.sample
    )
end

# 3. musician

10.times do
    Musician.create(
        name: Faker::FunnyName.name,
        bank_account: (1..10000).to_a.sample,
        is_a_student?: [true, false].sample
    )
end

# 4. repair shops

10.times do
    RepairShop.create(
        name: "#{Faker::Name.name}'s #{["Repair", "Fixer"].sample} #{["Store", "Empire"].sample}",
        city: ["Dallas", "Houston", "Austin", "San Antonio"].sample,
        capacity: (10...50).to_a.sample
    )
end

# 5. product exchange

10.times do
    pe = ProductExchange.new
    pe.musician = Musician.all.sample
    pe.product = Product.all.sample
    pe.exchange_type = ["Rental", "Purchase", "Lessons"].sample
    pe.product.update(available?: false)
    pe.date_of_exchange = Faker::Date.between(from: '2020-06-15', to: '2020-07-10')

    pe.save
end

# 6. repair requests

10.times do
    rr = RepairRequest.new
    rr.repair_shop = RepairShop.all.sample
    rr.product = Product.all.sample
    rr.save
end