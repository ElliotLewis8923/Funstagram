require 'rails_helper'

describe 'User' do

	context 'Signed out' do

		it 'should not be able to submit a post' do
			visit '/posts'
			click_link 'Add a post'
			expect(page).to have_content 'You need to sign in or sign up before continuing.'
		end

		it 'can sign up with a username' do
			visit '/posts'
			click_link 'Sign up'
			fill_in 'Email', :with => 'test@test.com'
			fill_in 'Password', :with => 's3cr3tp455w0rd'
			fill_in 'Password confirmation', :with => 's3cr3tp455w0rd'
			fill_in 'Username', :with => 'hackerneodude123'
			click_button 'Sign up'
			expect(User.find_by(username: 'hackerneodude123')).not_to eq nil
		end

		it 'can sign in with a username' do
			visit '/posts'
			create(:elliot)
			click_link 'Sign in'
			fill_in 'user[login]', :with => 'imsocool123'
			fill_in 'Password', :with => 's3cr3tp455w0rd'
			click_button 'Log in'
			expect(page).to have_content 'Signed in successfully.'
		end
	
	end

end