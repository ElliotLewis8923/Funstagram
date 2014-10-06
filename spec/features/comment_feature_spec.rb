require 'rails_helper'

describe 'Comment' do
	
	context 'Posting a comment' do
		before(:each) do
			@post = create(:post)
		end

		it 'should display a form to create a post' do
			visit '/posts'
			click_link 'Leave a comment'
			expect(page.has_field? 'Text').to eq true
		end
	end

end