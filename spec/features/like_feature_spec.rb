require 'rails_helper'

describe 'Likes' do

	before(:each) do
		create(:elliot)
		@user = create(:gilbert)
		@post = create(:post)
		login_as @user
		visit '/posts'
	end
	
	it 'are displayed for a specific post', :js => true do
		find('.image-link').click
		click_link 'Like'
		expect(page).to have_content '1 like'
	end

	it 'can be unliked', :js => true do
		find('.image-link').click
		click_link 'Like'
		click_link 'Unlike'
		expect(page).to have_content '0 likes'
	end

end