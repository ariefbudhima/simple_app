class Core::User
    include Mongoid::Document
    store_in client: "default", collection: "user"
    
    field :first_name, type: String
    field :last_name, type: String
    field :gender, type: String
    field :birthday, type: String
    field :email, type: String

    def fullname
        "#{self.first_name} #{self.last_name}".strip 
    end
end