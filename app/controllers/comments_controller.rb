class CommentsController < ApplicationController
    def index
        if params[:user_id].present?
            render json:  Comment.where(author_id: params[:user_id]), status: :ok
        elsif params[:artwork_id].present?
            render json: Comment.where(artwork_id: params[:artwork_id])
        end    
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment, status: :created
        else
            render json: {error: comment.errors.full_messages}, status: :unprocessable_entity
        end        
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        render json: comment
    end
             
    private
    def comment_params
        params.require(:comment).permit(:author_id, :artwork_id, :body)
    end
end