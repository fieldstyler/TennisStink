class Api::V1::Matches::PlayerController < ApplicationController
  def index
    render json: MatchSerializer.new(Match.where(player_id: params[:id]))
  end
end
