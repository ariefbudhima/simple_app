class V1::ErrorResult
    attr_reader :status,
                :http_code,
                :status_code,
                :status_message

    ERROR = 0
    SUCCESS = 1

    def initialize(http_code:, status_code:, status_message:)
        @status = ERROR
        @http_code = http_code
        @status_code = status_code
        @status_message = status_message
    end

    def success?
        @status == SUCCESS
    end

    private
    def validate_status(status)
        case status
        when String
            message
        when Hash
            message.join(", ")
        when ActiveModel::Errors
            message.fullmessage.join(", ")
        else
            raise 'V1::SuccessResult => Unsupported Parameter Type'
        end
    end
end