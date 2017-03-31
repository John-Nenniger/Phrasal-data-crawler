class Article < ApplicationRecord
  has_many :contents

  validates :url, presence: true, uniqueness: true
  validates :title, presence: true, uniqueness: true
  validates :date, presence: true
end
