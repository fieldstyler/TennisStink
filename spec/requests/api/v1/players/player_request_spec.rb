require 'rails_helper'

RSpec.describe 'Players API Request' do
  it 'imports a list of all players' do
    tyty = Player.create!(name: "Tyler Fields", ranking: "4.5", location: "Lone Tree, CO", username: "tytyfields", password: "12345")
    harry = Player.create!(name: "Harry Fields", ranking: "4.5", location: "Lone Tree, CO", username: "hayhayfields", password: "abcde")

    get '/api/v1/players'

    expect(response).to be_successful
    players = JSON.parse(response.body, symbolize_names: true)
    expect(players[:data].size).to eq(2)
    player_hash = players[:data]
    player_hash.each do |player|
      expect(player).to have_key(:id)
      expect(player[:id]).to be_a String
      expect(player).to have_key(:type)
      expect(player[:type]).to be_a String
      expect(player).to have_key(:attributes)
      expect(player[:attributes]).to have_key(:name)
      expect(player[:attributes][:name]).to be_a String
      expect(player[:attributes]).to have_key(:ranking)
      expect(player[:attributes][:ranking]).to be_a String
      expect(player[:attributes]).to have_key(:location)
      expect(player[:attributes][:location]).to be_a String
      expect(player[:attributes]).to have_key(:username)
      expect(player[:attributes][:username]).to be_an String
    end
  end

  it 'finds player by id' do
    tyty = Player.create!(name: "Tyler Fields", ranking: "4.5", location: "Lone Tree, CO", username: "tytyfields", password: "12345")
    harry = Player.create!(name: "Harry Fields", ranking: "4.5", location: "Lone Tree, CO", username: "hayhayfields", password: "abcde")

    get "/api/v1/players/#{tyty.id}"

    expect(response).to be_successful
    player = JSON.parse(response.body, symbolize_names: true)
    expect(player.size).to eq(1)
    expect(player).to have_key(:data)
    expect(player[:data]).to be_a Hash
    expect(player[:data]).to have_key(:id)
    expect(player[:data][:id]).to be_a String
    expect(player[:data]).to have_key(:type)
    expect(player[:data][:type]).to be_a String
    expect(player[:data]).to have_key(:attributes)
    expect(player[:data][:attributes]).to have_key(:name)
    expect(player[:data][:attributes][:name]).to be_a String
    expect(player[:data][:attributes]).to have_key(:ranking)
    expect(player[:data][:attributes][:ranking]).to be_a String
    expect(player[:data][:attributes]).to have_key(:location)
    expect(player[:data][:attributes][:location]).to be_a String
    expect(player[:data][:attributes]).to have_key(:username)
    expect(player[:data][:attributes][:username]).to be_an String
  end

  it 'can create a player record' do
    player_params = ({
      name: 'Tyler Fields',
      ranking: "4.5",
      location: 'Lone Tree, CO',
      username: "tytyfields",
      password: "12345",
      })

    headers = {"CONTENT_TYPE" => "application/json"}
    post "/api/v1/players", headers: headers, params: JSON.generate(player_params)
    created_player = Player.last
    expect(response).to be_successful
    expect(created_player.id).to be_an Integer
    expect(created_player.name).to eq(player_params[:name])
    expect(created_player.ranking).to eq(player_params[:ranking])
    expect(created_player.location).to eq(player_params[:location])
    expect(created_player.username).to eq(player_params[:username])
    expect(created_player.password).to eq(player_params[:password])
  end
end
