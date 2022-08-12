class Core::Movie
    include Mongoid::Document
    store_in client: "default", collection: "movies"
    
    field :title, type: String
    field :rating, type: String
    field :thumbnail_url, type: String
    field :year, type: String
    field :description, type: String
    field :director, type: String
    field :keyword, type: String

    def fullname
        "#{self.first_name} #{self.last_name}".strip 
    end
end