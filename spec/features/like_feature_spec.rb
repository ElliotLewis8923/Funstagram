require 'rails_helper'

describe 'Like' do

	before(:each) do
		@user = create(:elliot)
		@post = create(:post)
		@comment = create(:comment)
		@comment.user = @user
		@post.user = @user
		login_as @user
	end
	
	it 'updates the like count of a specific post' do
		visit "/posts/#{@post.id}"
		click_link 'Like'
		expect(page).to have_content '1 like'
	end

end