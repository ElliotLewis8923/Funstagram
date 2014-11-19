require 'rails_helper'

describe 'Likes' do

	before(:each) do
		@user = create(:elliot)
		@post = create(:post)
		@comment = create(:comment)
		@comment.user = @user
		@post.user = @user
		login_as @user
	end
	
	it 'are displayed for a specific post', :js => true do
		visit '/posts'
		find('Testimage').trigger('click')
		click_link 'Like'
		sleep 20
		expect(page).to have_content '1 like'
	end

	it 'can be unliked', :js => true do
		visit '/posts'
		find('Testimage').trigger('click')
		click_link 'Like'
		sleep 20
		click_link 'Unlike'
		expect(page).to have_content '0 likes'
	end

end