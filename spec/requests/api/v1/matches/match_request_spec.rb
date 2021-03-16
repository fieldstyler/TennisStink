require 'rails_helper'

RSpec.describe 'Matches API Request' do
  it 'imports a list of all matches' do
    get '/api/v1/matches'

    expect(response).to be_successful
    require "pry"; binding.pry
    items = JSON.parse(response.body, symbolize_names: true)
    expect(items[:data].size).to eq(5)
    item_hash = items[:data]
    item_hash.each do |item|

      expect(item).to have_key(:id)
      expect(item).to have_key(:attributes)
      expect(item[:attributes]).to have_key(:name)
      expect(item[:attributes][:name]).to be_a String
      expect(item[:attributes]).to have_key(:description)
      expect(item[:attributes][:description]).to be_a String
      expect(item[:attributes]).to have_key(:unit_price)
      expect(item[:attributes][:unit_price]).to be_a Float
      expect(item[:attributes]).to have_key(:merchant_id)
      expect(item[:attributes][:merchant_id]).to be_an Integer
      expect(item[:attributes]).to have_key(:created_at)
      expect(item[:attributes][:created_at]).to be_a String
      expect(item[:attributes]).to have_key(:updated_at)
      expect(item[:attributes][:updated_at]).to be_a String
    end
  end
end
