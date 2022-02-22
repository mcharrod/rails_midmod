require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to :studio }
  end

  describe 'attributes' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :creation_year }
    it { should validate_presence_of :genre }
  end
end
