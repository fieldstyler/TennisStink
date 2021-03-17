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

  it 'returns match given match id' do
    tyty = Player.create!(name: "Tyler Fields", ranking: "4.5", location: "Lone Tree, CO", username: "tytyfields", password: "12345")
    harry = Player.create!(name: "Harry Fields", ranking: "4.5", location: "Lone Tree, CO", username: "hayhayfields", password: "abcde")
    match1 = tyty.matches.create!(match_type: "Singles", score: "6-4, 6-0", result: "Win", date: "01-03-2021", surface: "Hard Court", notes: "Played well. Stay aggressive throughout the match.")
    match2 = tyty.matches.create!(match_type: "Singles", score: "6-3, 7-6(3)", result: "Win", date: "02-13-2021", surface: "Clay", notes: "Bad forehand. Backswing too close to body.")
    match3 = harry.matches.create!(match_type: "Singles", score: "2-6, 6-4, 10-8", result: "Loss", date: "10-03-2020", surface: "Hard Court", notes: "Going for too much on my shots")
    match4 = harry.matches.create!(match_type: "Singles", score: "7-5, 6-1", result: "Win", date: "06-22-2020", surface: "Hard Court", notes: "Way too many double faults")
    get "/api/v1/matches/#{match2.id}"

    expect(response).to be_successful
    match = JSON.parse(response.body, symbolize_names: true)
    expect(match.size).to eq(1)
    expect(match).to have_key(:data)
    expect(match[:data]).to be_a Hash
    expect(match[:data]).to have_key(:id)
    expect(match[:data][:id]).to be_a String
    expect(match[:data]).to have_key(:attributes)
    expect(match[:data][:attributes]).to have_key(:match_type)
    expect(match[:data][:attributes][:match_type]).to be_a String
    expect(match[:data][:attributes]).to have_key(:score)
    expect(match[:data][:attributes][:score]).to be_a String
    expect(match[:data][:attributes]).to have_key(:result)
    expect(match[:data][:attributes][:result]).to be_a String
    expect(match[:data][:attributes]).to have_key(:date)
    expect(match[:data][:attributes][:date]).to be_an String
    expect(match[:data][:attributes]).to have_key(:surface)
    expect(match[:data][:attributes][:surface]).to be_a String
    expect(match[:data][:attributes]).to have_key(:notes)
    expect(match[:data][:attributes][:notes]).to be_a String
  end
  it 'can create a match record' do
    player = Player.create!(name: "Tyler Fields", ranking: "4.5", location: "Lone Tree, CO", username: "tytyfields", password: "12345")

    match_params = ({
      match_type: "Singles",
      score: "6-0, 6-0",
      result: "Win",
      date: "04-06-2020",
      surface: "Hard Court",
      notes: "Maybe I should go easier on my dad",
      player_id: player.id
      })

    headers = {"CONTENT_TYPE" => "application/json"}
    post "/api/v1/matches", headers: headers, params: JSON.generate(match_params)
    created_match = Match.last
    expect(response).to be_successful
    expect(created_match.id).to be_an Integer
    expect(created_match.match_type).to eq(match_params[:match_type])
    expect(created_match.score).to eq(match_params[:score])
    expect(created_match.result).to eq(match_params[:result])
    expect(created_match.date).to eq(match_params[:date])
    expect(created_match.surface).to eq(match_params[:surface])
    expect(created_match.notes).to eq(match_params[:notes])
    expect(created_match.player_id).to eq(player.id)
  end

  it 'can create match record without notes' do
    player = Player.create!(name: "Tyler Fields", ranking: "4.5", location: "Lone Tree, CO", username: "tytyfields", password: "12345")

    match_params = ({
      match_type: "Singles",
      score: "6-0, 6-0",
      result: "Win",
      date: "04-06-2020",
      surface: "Hard Court",
      player_id: player.id
      })

    headers = {"CONTENT_TYPE" => "application/json"}
    post "/api/v1/matches", headers: headers, params: JSON.generate(match_params)
    created_match = Match.last
    expect(response).to be_successful
    expect(created_match.notes).to eq(nil)
  end

  it 'can update a match record' do
    tyty = Player.create!(name: "Tyler Fields", ranking: "4.5", location: "Lone Tree, CO", username: "tytyfields", password: "12345")
    match = tyty.matches.create!(match_type: "Singles", score: "6-4, 6-0", result: "Win", date: "01-03-2021", surface: "Hard Court", notes: "Played well. Stay aggressive throughout the match.")

    score = Match.last.score
    match_params = ({score: "7-5, 6-0"})
    headers = {"CONTENT_TYPE" => 'application/json'}

    patch "/api/v1/matches/#{match.id}", headers: headers, params: JSON.generate(match_params)
    updated_match = Match.find(match.id)

    expect(response).to be_successful
    expect(updated_match.score).to_not eq(score)
    expect(updated_match.score).to eq("7-5, 6-0")
  end

  it 'can add notes to a match without notes' do
    tyty = Player.create!(name: "Tyler Fields", ranking: "4.5", location: "Lone Tree, CO", username: "tytyfields", password: "12345")
    match = tyty.matches.create!(match_type: "Singles", score: "6-4, 6-0", result: "Win", date: "01-03-2021", surface: "Hard Court")

    notes = Match.last.notes
    match_params = ({notes: "I'm pretty amazing"})
    headers = {"CONTENT_TYPE" => 'application/json'}

    patch "/api/v1/matches/#{match.id}", headers: headers, params: JSON.generate(match_params)
    updated_match = Match.find(match.id)

    expect(response).to be_successful
    expect(updated_match.notes).to_not eq(nil)
    expect(updated_match.notes).to eq("I'm pretty amazing")
  end

  it 'returns all matches for a specific player id' do

  end


end
