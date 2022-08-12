class V1::Movie::MovieSerializer < ActiveModel::Serializer
    attribute :data do
        {
            movie: {
                id: object[:id].to_s,
                title: object[:title],
                rating: object[:rating],
                thumbnail_url: object[:thumbnail_url],
                year: object[:year],
                description: object[:description],
                director: object[:director],
                keyword: object[:keyword]
            }
        }
    end

    attribute :meta do
        {
            total_pages: 0
        }
    end
end