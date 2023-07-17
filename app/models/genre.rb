class Genre < ApplicationRecord
  # itemとジャンルidでのアソシエーション
  has_many :items, foreign_key: "genre_id"

  validates :name, presence: true
end
