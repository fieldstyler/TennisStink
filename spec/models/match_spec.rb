require 'rails_helper'

RSpec.describe Match, type: :model do
  describe 'relationships' do
    it {should belong_to(:player)}
  end

  describe 'validations' do
    it { should validate_presence_of :type}
    it { should validate_presence_of :score}
    it { should validate_presence_of :result}
    it { should validate_presence_of :date}
    it { should validate_presence_of :surface}
  end
end
