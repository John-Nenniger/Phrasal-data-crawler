class ContentSerializer < ActiveModel::Serializer
  attributes :id, :sentence
  belongs_to :article

  class ArticleSerializer < ActiveModel::Serializer
    attributes :url
    has_many :contents
  end

end
