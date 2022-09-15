class UsersController < ApplicationController

    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to user_url(@user)
        else
            render json: @user.errors.full_messages, staus: 422
        end
    end

    def destroy
        @user = User.find_by(id: params[:id])
        @user.destroy
        render json: ["User deleted"]
    end

    def index
        render json: User.all
    end

    def show 
        @user = User.find_by(id: params[:id])
        render json: @user
    end

    def update 
        @user = User.find_by(id: params[:id])

        if @user.update(user_params)
            redirect_to user_url(@user)
        else
            render json: @user.errors.full_messages, staus: 422
        end        
    end

    private

    def user_params
        params.require(:user).permit!
    end
    
end
