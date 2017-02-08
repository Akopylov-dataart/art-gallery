FactoryGirl.define do
  factory :artwork do
    title { Faker::Commerce.product_name }
    year { Faker::Date.between(3000.year.ago, Date.today).year }
    published false
    artist
    image { Rack::Test::UploadedFile.new Rails.root.join('spec', 'images', 'test.png'), 'image/png' }

    factory :published_artwork do
      published true
    end
  end
end
