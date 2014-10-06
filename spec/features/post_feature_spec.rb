require 'rails_helper'

describe 'post' do
    context 'no posts submitted' do
        
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
    end
end