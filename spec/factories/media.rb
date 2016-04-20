# /spec/factories/media.rb
FactoryGirl.define do
  factory :media do
    association :album
    link nil
    image { Rack::Test::UploadedFile.new(File.open(Rails.root.join(*%w[spec fixtures test_image.png]))) }
  end
end