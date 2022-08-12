class Api::V1::Movie::MovieController < ApplicationController
    def submit
        result = V1::Movie::MovieService.new.submit(params_submit)

        if result.success?
            render_json_success(result, result.status_message, ::V1::Movie::MovieSerializer)
        else
            render_json_error result
        end
    end

    def list_movies
        result = V1::Movie::MovieService.new.list_movies(params)

        if result.success?
            render_json_success(result, result.status_message, ::V1::Movie::MovieSerializer)
        else
            render_json_error result
        end
    end

    def detail_movie
        result = V1::Movie::MovieService.new.detail_movie(params)


        if result.success?
            render_json_success(result, result.status_message, ::V1::Movie::MovieSerializer)
        else
            render_json_error result
        end
    end

    def update_movie
        result = V1::Movie::MovieService.new.update_movie(params)

        if result.success?
            render_json_success(result, result.status_message, ::V1::Movie::MovieSerializer)
        else
            render_json_error result
        end
    end

    def remove_movie
        result = V1::Movie::MovieService.new.remove_movie(params)

        if result.success?
            render_json_success(result, result.status_message, ::V1::Movie::MovieSerializer)
        else
            render_json_error result
        end
    end

    private
    def params_submit
        params.require([
            :title,
            :year,
            :description,
            :director
        ])
        params.permit([
            :title,
            :rating,
            :thumbnail_url,
            :year,
            :description,
            :director,
            :keyword
        ])
    end
end