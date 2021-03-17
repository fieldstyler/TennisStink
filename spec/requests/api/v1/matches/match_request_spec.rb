require 'rails_helper'

RSpec.describe 'Matches API Request' do
  it 'imports a list of all matches' do
    tyty = Player.create!(name: "Tyler Fields", ranking: "4.5", location: "Lone Tree, CO", username: "tytyfields", password: "12345")
    harry = Player.create!(name: "Harry Fields", ranking: "4.5", location: "Lone Tree, CO", username: "hayhayfields", password: "abcde")
    match1 = tyty.matches.create!(match_type: "Singles", score: "6-4, 6-0", result: "Win", date: "01-03-2021", surface: "Hard Court", notes: "Played well. Stay aggressive throughout the match.")
    match2 = tyty.matches.create!(match_type: "Singles", score: "6-3, 7-6(3)", result: "Win", date: "02-13-2021", surface: "Clay", notes: "Bad forehand. Backswing too close to body.")
    match3 = harry.matches.create!(match_type: "Singles", score: "2-6, 6-4, 10-8", result: "Loss", date: "10-03-2020", surface: "Hard Court", notes: "Going for too much on my shots")
    match4 = harry.matches.create!(match_type: "Singles", score: "7-5, 6-1", result: "Win", date: "06-22-2020", surface: "Hard Court", notes: "Way too many double faults")
    get '/api/v1/matches'

    expect(response).to be_successful
    matches = JSON.parse(response.body, symbolize_names: true)
    expect(matches[:data].size).to eq(4)
    match_hash = matches[:data]
    match_hash.each do |match|

      expect(match).to have_key(:id)
      expect(match).to have_key(:attributes)
      expect(match[:attributes]).to have_key(:match_type)
      expect(match[:attributes][:match_type]).to be_a String
      expect(match[:attributes]).to have_key(:score)
      expect(match[:attributes][:score]).to be_a String
      expect(match[:attributes]).to have_key(:result)
      expect(match[:attributes][:result]).to be_a String
      expect(match[:attributes]).to have_key(:date)
      expect(match[:attributes][:date]).to be_an String
      expect(match[:attributes]).to have_key(:surface)
      expect(match[:attributes][:surface]).to be_a String
      expect(match[:attributes]).to have_key(:notes)
      expect(match[:attributes][:notes]).to be_a String
    end
  end
end
