require 'rails_helper'

RSpec.describe Match, type: :model do
  describe 'relationships' do
    it {should belong_to(:player)}
  end
end
