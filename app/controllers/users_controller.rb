class UsersController < ApplicationController
    def index
      if params[:username].present?
        users = User.where("username like ?", "%#{params[:username]}%")
      else  
        users = User.all
      end  
        render json: users, status: :ok
    end

    def show 
        user = User.find(params[:id])
        render json: user, status: :ok
    end

    def create 
        user = User.new(user_params)
        if user.save 
            render json: user, status: :created
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end            

    def destroy
      user = User.find_by(id: params[:id])
      user.destroy
      render json: user
    end      
    
    def update 
      user = User.find(params[:id])
      if user.update(user_params)
        render json: user, status: :ok
      else
        render json: {message: user.errors.full_messages}, status: :unprocessable_entity 
      end
    end

    def favorites 
      favorite_artworks_owned = Artwork.where(artist_id: params[:user_id]).where(is_favorite: true)
      favorite_artworks_shared = User.find(params[:user_id]).shared_artworks.where(is_favorite: true)
      render json: favorite_artworks_owned + favorite_artworks_shared 
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end
 end