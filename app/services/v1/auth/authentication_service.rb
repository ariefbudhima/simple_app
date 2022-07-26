class V1::Auth::AuthenticationService

    def register_user
        user_form = Form::UserForm.new(params_user)
    end
end