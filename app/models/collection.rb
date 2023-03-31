class Collection < ApplicationRecord
    validates :owner_id, presence: true
    belongs_to :owner, class_name: 'User', foreign_key: :owner_id
    has_many :collection_artworks
end