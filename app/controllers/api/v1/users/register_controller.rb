class Api::V1::Users::RegisterController < ApplicationController

    def register
        register_service = V1::Users::RegisterService.new
        
        # gue mau dapetin result
        result = register_service.register(params_user)
        if result.nil?
            render :status => 422
        else
            render :status => 200
        end
    end

    private
    def params_user 
        params.require([
            :first_name,
            :last_name,
            :gender,
            :birthday,
            :email,
        ])
        params.permit([
            :first_name,
            :last_name,
            :gender,
            :birthday,
            :email,
        ])
    end
end