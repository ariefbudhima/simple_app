class V1::Users::RegisterService
    
    def register(params_user)
        # here we provide register user
        user_form = Form::UserForm.new(params_user)
        user = Core::User.find_or_initialize_by(params_user.to_h)

        if user.new_record?
            user.save!
            V1::SuccessResult.new(
                status_message: "Success create new user",
                data: user,
                meta: nil
            )
        else
            V1::ErrorResult.new(
                http_code: 422,
                status_code: 422,
                status_message: "Failed create new user",
            )
        end
    end
end