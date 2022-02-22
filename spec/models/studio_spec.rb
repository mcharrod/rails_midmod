require 'rails_helper'

RSpec.describe Studio do
  describe 'relationships' do
    it { should have_many :movies }
  end

  describe 'attributes' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :location }
  end
end
