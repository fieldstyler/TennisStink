class Api::V1::MatchesController < ApplicationController
  def index
    render json: MatchSerializer.new(Match.all)
  end

  def show
    render json: MatchSerializer.new(Match.find(params[:id]))
  end

  def create
    render json: MatchSerializer.new(Match.create(match_params))
  end

  def update
    render json: MatchSerializer.new(Match.update(params[:id], match_params))
  end

  def destroy
    Match.destroy(params[:id])
    # render status: 204
  end

  private

  def match_params
    params.permit(:match_type, :score, :result, :date, :surface, :notes, :player_id)
  end
end
