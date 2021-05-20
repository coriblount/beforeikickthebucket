class ApplicationController < ActionController::API
    before_action :authorized

    def auth_header

    end

    def decoded_token
        if auth_header
        return true
    end
     
    def current_user
        if decoded_token
        return true
    end

    def logged_in?
         !!current_user
    end

    def authorized
        render json: {
            results: "Please login"
        }, status: :unauthorized, unless logged_in?
    end
end
