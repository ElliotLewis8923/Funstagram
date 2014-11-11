require 'rails_helper'

describe 'Likes' do

	before(:each) do
		@user = FactoryGirl.create(:elliot)
		@post = FactoryGirl.create(:post)
		@comment = FactoryGirl.create(:comment)
		@comment.user = @user
		@post.user = @user
		login_as @user
	end
	
	it 'are displayed for a specific post', :js => true do
		visit '/posts'
		find('ul li:first-child').click
		click_link 'Like'
		sleep 20
		expect(page).to have_content '1 like'
	end

	it 'can be unliked', :js => true do
		visit '/posts'
		find('ul li:first-child').click
		click_link 'Like'
		sleep 10
		click_link 'Unlike'
		expect(page).to have_content '0 likes'
	end

end