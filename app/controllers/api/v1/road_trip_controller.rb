class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      road_trip = RoadTripFacade.trip_out(params[:origin], params[:destination])
      render json: RoadTripSerializer.new(road_trip), status: :created
    else
      render json: { body: 'Unauthorized' }, status: :unauthorized
    end
  end
end
