require 'response/common_template'

class ApplicationController < ActionController::API
    include Response::CommonTemplate
    include Authenticate::Auth
    
    def authenticate
        
    end

    def login
        JWT.encode()
    end

end
