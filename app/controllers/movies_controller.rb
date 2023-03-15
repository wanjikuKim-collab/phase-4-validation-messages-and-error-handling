class MoviesController < ApplicationController
  def index
    movies = Movie.all
    render json: movies
  end

  def create
    movie = Movie.create(movie_params)
    if movie.valid?
    render json: movie, status: :created
   else
    render json: { errors: movie.errors.full_messages }, status: :unprocessable_entity
   end
  end

  private
  def movie_params
    params.permit(:title, :year, :length, :director, :description, :poster_url, :category, :discount, :female_director)
  end
  
end
