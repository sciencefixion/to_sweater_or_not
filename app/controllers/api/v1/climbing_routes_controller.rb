class Api::V1::ClimbingRoutesController < ApplicationController
  def index
    climbing_routes = ClimbingRoutesFacade.climbing_routes(params[:location])
    render json: ClimbingRoutesSerializer.new(climbing_routes)
  end
end
