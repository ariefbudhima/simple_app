class ErrorSerializer < ActiveModel::Serializer

    attributes

    def attributes(*args)
        results = {
          status: 'error',
          status_code: object.status_code,
          status_message: object.status_message,
          result: {}
        }

        results
    end

end