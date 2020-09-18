class GenresController < ApplicationController
    before_action :set_genre, only: [:show, :edit, :update]

    def index
        @genre = Genre.all
    end

    def new
        @genre = Genre.new
    end

    def create
        @genre = Genre.create(genre_param)
        redirect_to genre_path(@genre)
    end

    def update
        @genre.update(genre_param)
        redirect_to genre_path(@genre)
    end

    private

    def set_genre
        @genre = Genre.find(params[:id])
    end

    def genre_param
        params.require(:genre).permit(:name)
    end
end
