class ArtworkSharesController < ApplicationController
    def create
        @artwork_share = ArtworkShare.new(artwork_shares_params)

        if @artwork_share.save
            render json: @artwork_share
        else
            render json: @artwork_share.errors.full_messages, staus: 422
        end
    end

    def destroy
        @artwork_share = ArtworkShare.find_by(id: params[:id])
        @artwork_share.destroy
        render json: @artwork_share
    end

    private
    def artwork_shares_params
        params.require(:artwork_share).permit!
    end

end
