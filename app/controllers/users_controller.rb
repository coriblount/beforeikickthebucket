class UsersController < ApplicationController
    has_many :trips
    has_secure_password

    def create
        user = User.create(user_params)
        if user.valid?
           token = encode_token(payload) 
           render json: {user: user, jwt:token}
        else
            render json: {errors: "Please try again"}
    end

    private
   def user_params
    params.permit(:username, :password)
end

end
