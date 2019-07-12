class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  before_action :set_user, only: [:show]

  # POST /signup
  # return authenticated token upon signup
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.username, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  # GET /list
  def list
    json_response(User.all.select(:id, :username))
  end

  # GET /prayers/:id
  def show
    json_data = {
      id: @user.id,
      username: @user.username,
      current_user: (@user == current_user),
      prayer_count: @user.prayer_count,
      not_prayer_count: @user.not_prayer_count
    }
    json_response(json_data)
  end

  # PUT /prayers/:id
  def update
    current_user.update(user_params)
    head :no_content
  end

  private

  def user_params
    params.permit(
      :name,
      :email,
      :username,
      :password,
      :password_confirmation,
      :prayer_count,
      :not_prayer_count
    )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
