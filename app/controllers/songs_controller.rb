class SongsController < ApplicationController
    before_action :set_song, only: [:show, :edit, :update]

    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(song_param(:name, :artist_id, :genre_id))
        redirect_to song_path(@song)
    end

    def update
        @song.update(song_param(:name, :artist_id, :genre_id))
        redirect_to song_path(@song)
    end

    private

    def set_song
        @song = Song.find(params[:id])
    end

    def song_param(*args)
        params.require(:song).permit(*args)
    end
end
