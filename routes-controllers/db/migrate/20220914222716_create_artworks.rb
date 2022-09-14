class CreateArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.string :title, null: false
      t.string :image_url, null: false, index: { unique: true }
      t.bigint :artist_id, null: false
      
      t.index [:artist_id, :title], unique: true
      t.timestamps

    end

  end
end
