class Authenticate::Auth
    # SECRET = Rails.application.secrets.secret_key_base.to_s

    def self.issue(payload, secret, exp = 2.days.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, secret)
    end

    def self.decode(token, secret)
        JWT.decode(token, secret)
    end
end