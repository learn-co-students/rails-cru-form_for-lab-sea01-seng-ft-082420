class ArtistsController < ApplicationController
    before_action :set_artist, only: [:show, :edit, :update]

    def index
        @artists = Artist.all
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.create(artist_param(:name, :bio))
        redirect_to artist_path(@artist)
    end

    def update
        @artist.update(artist_param(:name, :bio))
        redirect_to artist_path(@artist)
    end

    private

    def set_artist
        @artist = Artist.find(params[:id])
    end

    def artist_param(*args)
        params.require(:artist).permit(*args)
    end
end
