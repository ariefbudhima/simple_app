module Response
    module CommonTemplate
        def render_json_success(result, status_message, serializer, meta = {})
            json_data = {
                status: 'success',
                status_code: 200,
                status_message: status_message,
                result: {}
            }
            
            case result.data
            when Array
                json_data[:result][:data] = ActiveModel::Serializer::CollectionSerializer.new(result.data, {serializer: serializer, meta: meta})
                json_data[:result][:meta] = result.meta
            when Hash, Object
                if result.data
                    json_data[:result] = serializer.new(result.data, { meta: meta })
                end
            else
                raise "Unsupported Result Klass, expected: 'Array' or 'Object', got: #{result.class.to_s}"
            end
            json_data.merge!(result.extra_data) if result.try(:extra_data).present?
            
            render json: json_data
        end

        def render_json_error(result)
            render json: ErrorSerializer.new(result).as_json, status: result.http_code
        end

        def render_json_error_401
            render json: {
                status: "error",
                status_code: 401,
                status_message: "Unauthorized",
                result: {}
            }.to_json, status: :unauthorized
        end

        def render_json_error_parameter
            render json: {
                status: "error", 
                status_code: 422, 
                status_message: "Parameter missing.", 
                result: {}
            }.to_json, status: :unprocessable_entity
        end
    end
end