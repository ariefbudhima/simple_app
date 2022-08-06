class V1::Users::UserSerializer < ActiveModel::Serializer
    attribute :data do
        {
            user: {
                id: object[:id].to_s
            }
        }
    end

    attribute :meta do
        {
            total_pages: 0
        }
    end
end