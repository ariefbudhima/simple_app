class Api::V1::Users::RegisterController < ApplicationController

    def register
        register_service = V1::Users::RegisterService.new        
        # gue mau dapetin result
        result = register_service.register(params_user)
        if result.success?
            render_json_success(result, result.status_message, ::V1::Users::UserSerializer)
        else
            render_json_error result
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