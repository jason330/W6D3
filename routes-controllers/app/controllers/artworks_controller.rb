class ArtworksController < ApplicationController
    def create
        @artwork = Artwork.new(artwork_params)

        if @artwork.save
            redirect_to artwork_url(@artwork)
        else
            render json: @artwork.errors.full_messages, staus: 422
        end
    end

    def destroy
        @artwork = Artwork.find_by(id: params[:id])
        @artwork.destroy
        render json: ["Artwork deleted"]
    end

    def index
        @user = User.find_by(id: params[:user_id])
        # @shared_artworks = ArtworkShare.find_by(id: params[:])

        # render json: @user.artworks, @user.shared_artworks
        render json: @user, include: [:artworks, :shared_artworks]
    end

    def show 
        @artwork = Artwork.find_by(id: params[:id])
        render json: @artwork
    end

    def update 
        @artwork = Artwork.find_by(id: params[:id])

        if @artwork.update(artwork_params)
            redirect_to artwork_url(@artwork)
        else
            render json: @artwork.errors.full_messages, staus: 422
        end        
    end

    private

    def artwork_params
        params.require(:artwork).permit!
    end
end
