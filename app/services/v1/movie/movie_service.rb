class V1::Movie::MovieService

    def submit(params)
        movie = Core::Movie.find_or_initialize_by(params.to_h)
        if movie.new_record?
            movie.save!
            V1::SuccessResult.new(
                status_message: "Success submit movie",
                data: movie,
                meta: nil
            )
        else
            V1::ErrorResult.new(
                http_code: 422,
                status_code: 422,
                status_message: "Failed to submit movie"
            )
        end
    end
end