class V1::SuccessResult
    attr_reader :status,
                :status_message,
                :data,
                :meta

    SUCCESS = 1

    def initialize(status_message:, data:, meta:)
        @status = SUCCESS
        @status_message = status_message
        @data = data
        @meta = meta
    end

    def success?
        @status == SUCCESS
    end

    private
    def validate_data(data)
        case data
        when String, Hash, Array
            data
        when Mongoid::Criteria
            data.to_a
        else
            raise 'V1::SuccessResult => Unsupported Parameter Type'
        end
    end
end