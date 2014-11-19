
include ActionDispatch::TestProcess

FactoryGirl.define do

factory :post do
    caption 'first post'
    image { fixture_file_upload(Rails.root.join('app', 'assets', 'images', 'testimage.png'), 'image/png') }
    user_id 1
  end

factory :comment do
		text 'nice pic'
		post
	end

factory :user do

		factory :elliot do
			id 1
			email 'elliot@mydomain.com'
			password 's3cr3tp455w0rd'
			username 'imsocool123'
		end

		factory :gilbert do
			id 2
			email 'gilbert@mydomain.com'
			password 's3cre3tp455w0rd'
			username 'hacker1337'
		end
	
	end

end