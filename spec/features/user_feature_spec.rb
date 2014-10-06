require 'rails_helper'

describe 'User' do

	context 'Signed out' do

		it 'should not be able to submit a post' do
			visit '/posts'
			click_link 'Add a post'
			expect(page).to have_content 'You need to sign in or sign up before continuing.'
		end
	
	end

end