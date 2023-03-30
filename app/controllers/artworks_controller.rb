class ArtworksController < ApplicationController
    def index
        artworks_owned = Artwork.where(artist_id: params[:user_id])
        artworks_viewable = User.find(params[:user_id]).shared_artworks
        render json: artworks_owned + artworks_viewable, status: :ok
    end

    def show
        artwork = Artwork.find(params[:id])
        render json: artwork, status: :ok
    end

    def update
        artwork = Artwork.find(params[:id])
        if artwork.update(artwork_params)
            render json: {sucess: "Artwork #{params[:id]} has been updated"}, status: :ok
        else
            render json: {Errors: artwork.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def create
        p "CATCATCAT", artwork_params
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: {sucess: "New artwork created"}, status: :ok
        else
            render json: {Errors: artwork.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        artwork = Artwork.find(params[:id])
        if artwork.destroy
            render json: artwork, status: :ok
        else
            render json: {Errors: artwork.errors.full_messages}, status: :unprocessable_entity
        end
    end
    
    private
    def artwork_params
        p params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end