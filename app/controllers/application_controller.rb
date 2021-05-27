class ApplicationController < ActionController::API
    before_action :authorized


    def secret_key
        "my_secret"
    end

    def encode_token(payload) 
        JWT.encode(payload, secret_key,'HS256' )
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
        token = auth_header.split(' ')[1]
        begin
            JWT.decode(token,'my_secret', true, {algorithm: 'HS256'})
        rescue JWT::DecodeError
            []
        end
      end
    end
     
    def current_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
         !!current_user
    end

    def authorized
        render json: {
            result: "Please log in"
        }, status: :unauthorized unless logged_in?
    end


end
