class Api::V1::BackgroundsController < ApplicationController
  def index
    deepai_image_data = DeepaiService.get_image(params[:location])

    render json: BackgroundsSerializer.new(Background.new(params[:location], deepai_image_data))
  end
end
