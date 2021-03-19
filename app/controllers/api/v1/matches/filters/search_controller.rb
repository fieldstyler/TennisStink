class Api::V1::Matches::Filters::SearchController < ApplicationController
  def index
    render json: MatchSerializer.new(MatchFacade.new(params).filter)
  end
end
