require 'rails_helper'

RSpec.describe User, :type => :model do

	context 'Associations' do

		it { should have_many(:posts)    }
		
		it { should have_many(:comments) }

	end

	context 'Validations' do

		it { should validate_presence_of(:username) }

	end

end