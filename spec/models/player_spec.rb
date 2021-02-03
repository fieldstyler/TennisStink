require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password)}
    it {should validate_uniqueness_of(:username)}
  end

  describe 'relationships' do
    it {should have_many(:matches)}
  end
end 
