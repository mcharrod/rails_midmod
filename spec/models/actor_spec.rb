require 'rails_helper'

describe Actor do
  describe 'relationships' do
    it { should have_many :movie_actors }
    it { should have_many(:movies).through(:movie_actors) }
  end

  describe 'attributes' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
  end
end
