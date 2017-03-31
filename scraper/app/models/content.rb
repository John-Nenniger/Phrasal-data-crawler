class Content < ApplicationRecord
  belongs_to :article

  validates :sentence, uniqueness: {scope: :article_id}
end
