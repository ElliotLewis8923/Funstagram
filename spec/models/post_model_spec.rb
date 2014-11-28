require 'rails_helper'

RSpec.describe Post, :type => :model do

	context 'Associations' do

		it { should belong_to(:user)    }
		
		it { should have_many(:comments) }

	end

	context 'Validations' do

		it { should validate_attachment_presence(:image)     }
	
		it { should validate_attachment_content_type(:image). 
										allowing('image/png'). 
										rejecting('text/plain', 'text/xml') }

	end

end