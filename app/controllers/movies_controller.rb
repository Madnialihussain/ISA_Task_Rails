class MoviesController < ApplicationController

    def index
        @movies = Movie.all
        render json: @movies, only: [:movie_name]
      end
end
