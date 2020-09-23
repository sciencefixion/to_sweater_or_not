class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      render json: RoadTripSerializer.new(RoadTripFacade.trip_out(params[:origin], params[:destination])), status: :created
    else
      render json: { body: 'Unauthorized' }, status: :unauthorized
    end
  end
end
