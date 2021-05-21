class AuthController < ApplicationController


    def create
        user = User.find_by(username: auth_params[:username])
        if user && user.authenticate(auth_params[:password])
            payload = {user.id: user.id}
            token = encode_token(payload)
            render json: {user: user, jwt: token, success: "Welcome Back!" }
        else
            render json: {failure: "Login failed"}
    end
end
     
  def auth_params
    params.require(:auth).permit(:username, :password)
  end  

end
