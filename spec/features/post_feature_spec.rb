require 'rails_helper'
require 'spec_helper'

describe 'post' do
    context 'no posts submitted' do

    	before(:each) do
    		login_as create(:elliot)
    	end
        
        it 'should display a prompt to add a post' do
          visit '/posts'
          expect(page).to have_content 'No posts'
          expect(page).to have_link 'Add a post'
        end

        it 'should provide a form to submit a post' do
        	visit '/posts'
        	click_link 'Add a post'
        	expect(page).to have_content 'Caption'
        	expect(page).to have_content 'Image'
        end

        it 'should submit a post' do
        	visit '/posts'
        	click_link 'Add a post'
        	fill_in 'Caption', :with => 'first post'
        	attach_file('Image', './app/assets/images/test_image.png')
        	click_button 'Submit'
        	expect(page).to have_link 'Add a post'
        	expect(page).not_to have_content 'No posts'
        end
    end

    context 'posts have been submitted' do

    	before(:each) do
    		@post = create(:post)
    		login_as create(:elliot)
    	end

    		it 'should display posts and their images on the homepage' do
    			visit '/posts'
    			expect(page).to have_content 'first post'
    			expect(page).to have_css("img")
    		end

    		it 'should display a larger image when clicked' do
    			visit '/posts'
    			click_link 'image'
    			expect(page).to have_css("img")
    			expect(page).not_to have_content 'Add a post'
    		end


    end
end