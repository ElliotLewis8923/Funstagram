require 'rails_helper'

describe 'User' do

	context 'Signed out' do

		before(:each) do
			visit '/posts'
		end

		it 'can sign up with a username' do
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

		it 'can not leave a comment on a post' do
			post = create(:post)
			expect(page).not_to have_content 'Leave a comment'
			visit "/posts/#{post.id}/comments/new"
			expect(current_path).to eq '/users/sign_in'
		end
	
	end

	context 'Signed in' do

		before(:each) do
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
		
		context 'permissions' do

			before(:each) do
				@post.user_id = @user.id
				@post.save
				visit '/posts'
				click_link 'image'
			end


			it 'can delete its own posts' do
				click_link 'Delete'
				expect(current_path).to eq '/posts'
				expect(page).to have_content "Your post was successfully destroyed"
			end

			it "can edit its own posts" do
				click_link 'Edit'
				fill_in 'Caption', :with => 'changed caption'
				click_button 'Submit'
				expect(page).to have_css 'img'
				expect(page).to have_content 'changed caption'
			end
		end

		context 'restrictions' do

			before(:each) do
				@user2 = create(:elliot)
				@post.user_id = @user2.id
				@post.save
				visit '/posts'
				click_link 'image'
			end

			it "can not delete other users' posts" do
				expect(page).not_to have_content 'Delete'
			end

			it "can not edit other users' posts" do
				expect(page).not_to have_content 'Edit'
				visit "/posts/#{@post.id}/edit"
				expect(current_path).to eq '/posts'
			end

			it 'can only like a post once' do
				click_link 'Like'
				expect(page).to have_content '1 like'
				expect(page).to have_content 'Unlike'
			end


		end

	end

end