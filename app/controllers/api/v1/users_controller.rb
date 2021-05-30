class Api::V1::UsersController < ApplicationController
skip_before_action :authorized, only: [:create, :destroy]


    def profile
        render json: {user: UserSerializer.new(current_user)}, status: :accepted
    end

    def index
        @users = User.all
        render json: @users
    end

    def create
        user = User.create(user_params)
        if user.valid?
        payload = {user_id: user.id}
        token = encode_token(payload)
        render json: {user: user, jwt: token}
        else
            render json: {errors: "Please try again"}
    end
end

def show
    user = User.find_by(params[:id])
    render json: @users
end

def destroy
    user = User.destroy(user_params)
    render json: @user
end 


    private
    def user_params
    params.permit(:id, :username, :password)
end


end
