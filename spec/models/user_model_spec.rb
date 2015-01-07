require 'rails_helper'

# include ActiveModel::Validations

describe User do

	context 'Associations' do

		it { should have_many(:posts)    }
		
		it { should have_many(:comments) }

	end

	context 'Validations' do

		it { should validate_presence_of(:username) }

		it { should ensure_length_of(:username)     }

	end

end