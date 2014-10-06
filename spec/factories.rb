
include ActionDispatch::TestProcess

FactoryGirl.define do

factory :post do
    caption 'first post'
    image  { fixture_file_upload(Rails.root.join('app', 'assets', 'images', 'test_image.png'), 'image/png') }
  end

factory :comment do
		text 'nice pic'
		post
	end

factory :user do

		factory :elliot do
			email 'elliot@mydomain.com'
			password 's3cr3tp455w0rd'
			username 'imsocool123'
		end

		factory :gilbert do
			email 'gilbert@mydomain.com'
			password 's3cre3tp455w0rd'
			username 'hacker1337'
		end
	
	end

end