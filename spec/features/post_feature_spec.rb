require 'rails_helper'

describe 'post' do
    context 'no posts submitted' do
        
        it 'should display a prompt to add a post' do
            visit '/posts'
            expect(page).to have_content 'No posts'
            expect(page).to have_link 'Add a post'
        end
    end
end