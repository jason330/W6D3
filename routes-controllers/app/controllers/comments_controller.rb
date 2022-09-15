class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)

        if @comment.save
            render json: @comment
        else
            render json: @comment.errors.full_messages, status: 422
        end
    end

    def destroy
        @comment = Comment.find_by(id: params[:id])
        @comment.destroy

        render json: @comment
    end

    def index
        @user = User.find_by(id: params[:user_id])
        @artwork = Artwork.find_by(id: params[:artwork_id])

        if @user
            render json: @user.comments
        elsif @artwork
            render json: @artwork.comments
        end
    end

    private

    def comment_params
        params.require(:comment).permit!
    end
end
