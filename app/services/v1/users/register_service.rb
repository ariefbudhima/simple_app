class V1::Users::RegisterService
    
    def register(params_user)
        # here we provide register user
        user_form = Form::UserForm.new(params_user)
        user = Core::User.find_or_initialize_by(params_user.to_h)

        if user.new_record?
            user.save!
        else
            return 
        end
    end
end