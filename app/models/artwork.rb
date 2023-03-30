class Artwork < ApplicationRecord
    validates :title, presence: true, uniqueness: {scope: :artist_id, message: "artwork title should be unique"}
    validates :image_url, presence: true
    validates :artist_id, presence: true
    has_many :artwork_shares, class_name: 'ArtworkShare'
    belongs_to :artist, class_name: 'User', foreign_key: :artist_id, primary_key: :id, dependent: :destroy
    has_many :shared_viewers, through: :artwork_shares, source: :viewer

#    belongs_to(
#    :professor,    
#    class_name: 'Professor',
#    foreign_key: :professor_id,
#    primary_key: :id
#  )
#
#
#  has_many(
#    :courses,
#    class_name: 'Course',
#    foreign_key: :professor_id,
#    primary_key: :id
#  )
end    