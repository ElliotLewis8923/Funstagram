require 'rails_helper'

describe 'Comment' do
	
	context 'when posted' do
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


		it 'should display alongside their associated posts' do
			create(:comment)
			visit '/posts/'
			expect(page).to have_content 'nice pic'
		end

		it 'should display the username of their creator' do
			visit '/posts'
			click_link 'Leave a comment'
			fill_in 'Text', :with => 'nice pic'
			click_button 'Submit'
			logout
			click_link 'image'
			expect(page).to have_content 'imsocool123'
		end

			
	end

end