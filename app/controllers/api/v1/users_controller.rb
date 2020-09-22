class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)

    if user.save
      render json: UsersSerializer.new(user), status: :created
    else
      render json: { body: user.errors.full_messages.to_sentence, status: 400 }
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end