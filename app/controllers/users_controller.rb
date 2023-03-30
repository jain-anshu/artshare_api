class UsersController < ApplicationController
    def index
        users = User.all
        render json: users, status: :ok
    end

    def show 
        user = User.find(params[:id])
        render json: user, status: :ok
    end

    def create 
        user = User.new(user_params)
        if user.save 
            render plain: "New User id #{user.id} created", status: :ok
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end            

    def destroy
      user = User.find_by(id: params[:id])
      if user.nil?
        render json: {error: "User not found"}, status: :unprocessable_entity
      elsif user.destroy
        render json: user, status: :ok
      else
        render json: user.errors.full_messages, status: :unprocessable_entity
      end
    end      
    
    private
    def user_params
        params.require(:user).permit(:username)
    end
 end