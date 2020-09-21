class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def show
        @song = Song.all.find(params[:id])
        @artist = Artist.all.find{|a| a.id == @song.artist_id}
        @genre = Genre.all.find{|g| g.id == @song.genre_id}
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(song_params)
        redirect_to @song
    end

    def update
        @song = Song.all.find(params[:id])
        @song.update(song_params)
        redirect_to song_path(@song)
    end

    def edit
        @song = Song.all.find(params[:id])
        @songs = Song.all
    end

    private

    def song_params
        params.require(:song).permit(:name, :artist_id, :genre_id)
    end
end
