require 'rails_helper'

describe 'User' do

	context 'when signed out' do

		before(:each) do
			visit '/posts'
		end

		it 'can sign up with a username'  do
			click_link 'Sign up'
			fill_in 'Email', :with => 'test@test.com'
			fill_in 'Password', :with => 's3cr3tp455w0rd'
			fill_in 'Password confirmation', :with => 's3cr3tp455w0rd'
			fill_in 'Username', :with => 'hackerneodude123'
			click_button 'Sign up'
			expect(User.find_by(username: 'hackerneodude123')).not_to eq nil
		end

		it 'can sign in with a username' do
			create(:elliot)
			click_link 'Sign in'
			fill_in 'user[login]', :with => 'imsocool123'
			fill_in 'Password', :with => 's3cr3tp455w0rd'
			click_button 'Log in'
			expect(page).to have_content 'Signed in successfully.'
		end

		it 'can not create a post' do
			expect(page).not_to have_content 'Add a post'
			visit '/posts/new'
			expect(current_path).to eq '/users/sign_in'
		end

		it 'can not leave a comment on a post', :js => true do
			create(:post)
			create(:elliot)
			visit '/posts'
			find('.image-link').click			
			fill_in 'Text', :with => 'nice pic'
			click_button 'Submit'
			expect(current_path).to eq '/users/sign_in'
		end
	
	end

	context 'when signed in' do

		before(:each) do
			@user2 = create(:elliot)
			@user = create(:gilbert)
			@post = create(:post)
			login_as @user
		end


		it 'should display its username' do
			visit '/posts'
			expect(page).to have_content 'Welcome, hacker1337'
		end

		it 'should display a link to sign out' do
			visit '/posts'
			expect(page).to have_link 'Sign out'
		end


		
		context 'have permissions:' do

			before(:each) do
				visit '/posts'
				login_as @user2
			end


			it 'can delete its own posts', :js => true do
				find('.image-link').click
				click_link 'Delete'
				expect(current_path).to eq '/posts'
				expect(page).not_to have_css '.image-link'
			end

			it "can edit its own posts", :js => true do
				find('.image-link').click
				click_link 'Edit'
				fill_in 'Caption', :with => 'changed caption'
				click_button 'Submit'
				find('.image-link').click
				expect(page).to have_content 'changed caption'
			end
		end

		context 'have restrictions:' do

			before(:each) do
				login_as @user
				visit '/posts'
				find('.image-link').click
			end

			it "can not delete other users' posts", :js => true do
				expect(page).not_to have_content 'Delete'
			end

			it "can not edit other users' posts", :js => true do
				expect(page).not_to have_content 'Edit'
			end


		end

	end

	context 'has a profile' do

		before(:each) do
			create(:elliot)
			create(:gilbert)
			create(:post)
		end

		it 'which displays posts the user has uploaded' do
			visit '/users/1'
			expect(page).to have_css '.image-link'
		end
	end

end