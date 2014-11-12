require 'rails_helper'

describe 'Comment' do
	
	context 'when posted' do
		before(:each) do
			@post = create(:post)
			@user = create(:elliot)
			login_as @user
			@post.user = @user
		end

		it 'should display a form to create a post' do
			visit '/posts'
			click_link 'Testimage'
			expect(page.has_field? 'Text').to eq true
		end

		it 'should submit a comment', :js => true do
			visit '/posts'
			click_link 'Testimage'
			fill_in 'Text', :with => 'nice pic'
			click_button 'Submit'
			expect(current_path).to eq '/posts'
		end

		it 'should display alongside their associated posts', :js => true do
			visit '/posts'
			click_link 'Testimage'
			fill_in 'Text', :with => 'nice pic'
			click_button 'Submit'
			expect(page).to have_content('nice pic')
		end

		it 'should display the username of their creator', :js => true do
			visit '/posts'
			click_link 'Testimage'
			fill_in 'Text', :with => 'nice pic'
			click_button 'Submit'
			logout
			click_link 'Testimage'
			expect(page).to have_content 'imsocool123'
		end

			
	end

end