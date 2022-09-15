# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, :image_url, :artist_id, presence: true
    validates :title, uniqueness: { scope: :artist_id,
    message: "artist cannot have two artworks with the same title" } 

    belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User

    has_many :artwork_shares,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare,
    dependent: :destroy

    has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer
    
    # def self.artworks_for_user_id(user_id)
    #     Artwork.select("artworks.*").distinct.joins(:shared_viewers).where("artworks.artist_id = #{user_id} OR artwork_shares.viewer_id = #{user_id}" )
    # end

    has_many :comments,
    dependent: :destroy
end
