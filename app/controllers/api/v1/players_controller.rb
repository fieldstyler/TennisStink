class Api::V1::PlayersController < ApplicationController
  def index
    render json: PlayerSerializer.new(Player.all)
  end

  def show
    render json: PlayerSerializer.new(Player.find(params[:id]))
  end
  #
  # def create
  #   render json: PlayerSerializer.new(Player.create(player_params))
  # end
  #
  # def update
  #   render json: PlayerSerializer.new(Player.update(params[:id], player_params))
  # end
  #
  # def destroy
  #   Player.destroy(params[:id])
  #   render status: 204
  # end
  #
  # private
  #
  # def player_params
  #   params.permit(:name, :ranking, :location, :username, :password)
  # end
end
