class Comment < ApplicationRecord
    validates :artwork_id, presence: true
    validates :author_id, presence: true
    belongs_to :artwork, class_name: 'Artwork', foreign_key: :artwork_id, dependent: :destroy
    belongs_to :author, class_name: 'User', foreign_key: :author_id, dependent: :destroy
    has_many :likes, as: :likeable
end