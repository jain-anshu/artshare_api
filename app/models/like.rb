class Like < ApplicationRecord
    validates :liker_id, presence: true
    belongs_to :likeable, polymorphic: true
end