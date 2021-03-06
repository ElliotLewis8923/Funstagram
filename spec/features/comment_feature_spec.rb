require 'rails_helper'

describe 'Comment' do
	
	context 'when posted' do
		before(:each) do
			@user = create(:elliot)
			@post = create(:post)
			login_as @user
			visit '/posts'
		end

		it 'should display a form to create a post', :js => true do
			find('.image-link').click
  			expect(page).to have_selector 'textarea'
		end

		it 'should submit a comment', :js => true do
			find('.image-link').click
			fill_in 'Text', :with => 'nice pic'
			click_button 'Submit'
			expect(page).to have_content 'nice pic'
		end

		it 'should display alongside their associated posts', :js => true do
			find('.image-link').click
			fill_in 'Text', :with => 'nice pic'
			click_button 'Submit'
			expect(page).to have_content 'nice pic'
		end

		it 'should display the username of their creator', :js => true do
			find('.image-link').click
			fill_in 'Text', :with => 'nice pic'
			click_button 'Submit'
			sleep 50
			expect(page).to have_content 'imsocool123'
		end

			
	end

end