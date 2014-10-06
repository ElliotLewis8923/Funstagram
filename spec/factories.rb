
include ActionDispatch::TestProcess

FactoryGirl.define do

factory :post do
    caption 'first post'
    image  { fixture_file_upload(Rails.root.join('app', 'assets', 'images', 'test_image.png'), 'image/png') }
  end

end