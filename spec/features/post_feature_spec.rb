require 'rails_helper'
require 'spec_helper'

describe 'Posts' do
    context 'when none have been submitted' do

    	before(:each) do
    		login_as create(:elliot)
            visit '/posts'
    	end
        
        it 'should display a prompt to add a post' do
          expect(page).to have_content 'No posts'
          expect(page).to have_link 'Add a post'
        end

        it 'should provide a form to submit a post' do
        	click_link 'Add a post'
        	expect(page).to have_content 'Caption'
        	expect(page).to have_content 'Image'
        end

        it 'should submit a post' do
        	click_link 'Add a post'
        	fill_in 'Caption', :with => 'first post'
        	attach_file('Image', './app/assets/images/testimage.png')
        	click_button 'Submit'
        	expect(page).to have_link 'Add a post'
        	expect(page).not_to have_content 'No posts'
        end
    end

    context 'when have already been submitted' do

    	before(:each) do
    		@post = create(:post)
    		login_as create(:elliot)
            visit '/posts'
    	end

    		it 'should be displayed with their images on the homepage' do
    			expect(page).to have_css('.image-link')
    		end

    		it 'should be display as a larger image when clicked' do
    			find('#masonry div:first-child .image-link').click
    			expect(page).to have_css("#ajax-modal")
    		end


    end
end