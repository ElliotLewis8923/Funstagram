require 'rails_helper'

describe 'Comment' do
	
	context 'Posting a comment' do
		before(:each) do
			@post = create(:post)
			login_as create(:elliot)
		end

		it 'should display a form to create a post' do
			visit '/posts'
			click_link 'Leave a comment'
			expect(page.has_field? 'Text').to eq true
		end

		it 'should submit a comment' do
			visit '/posts'
			click_link 'Leave a comment'
			fill_in 'Text', :with => 'nice pic'
			click_button 'Submit'
			expect(current_path).to eq '/posts'
		end


		it 'should display comments along with their associated posts' do
			create(:comment)
			visit '/posts'
			expect(page).to have_content 'nice pic'

		end
			
	end

end