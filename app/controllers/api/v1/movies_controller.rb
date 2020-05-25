require 'httparty'

module Api
  module V1

    class MoviesController < ApplicationController

      def index
        movies = Movie.order 'created_at DESC'
        render json: {status: 'SUCCESS', message: 'Loaded movies', data: movies}, status: :ok
      end

      # for now, POST adds random movies to the DB
      def create
        # movie = Movie.new movie_params
        #
        # if movie.save
        #   render json: {status: 'SUCCESS', message: 'Added movie', data: movie}, status: :ok
        # else
        #   render json: {status: 'ERROR', message: 'Movie not added', data: movie.errors}, status: :unprocessable_entity
        # end
        #
        # ::MovieDB.fetch_random_movie # eventually want to call this as a separate service
        #
        render json: {status: 'SUCCESS', message: 'Added random movies', data: fetch_random_movies}, status: :ok
      end

      def show
        movie = Movie.find params[:id]
        render json: {status: 'SUCCESS', message: 'Loaded movie', data: movie}, status: :ok
      end

      def update
        movie = Movie.find params[:id]
        if movie.update_attributes movie_params
          render json: {status: 'SUCCESS', message: 'Updated movie', data: movie}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Movie not updated', data: movie.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        movie = Movie.find params[:id]
        movie.destroy
        render json: {status: 'SUCCESS', message: 'Deleted movie', data: movie}, status: :ok
      end

      def movie_params
        params.permit(:title, :length, :overview)
      end

      def fetch_random_movies
        api_key = '3026c04c29acb3e523e35359a8564812'
        random_number = rand 50
        url = "https://api.themoviedb.org/3/movie/top_rated?page=#{random_number}&api_key=#{api_key}"

        response = HTTParty.get(url)
        parse_and_save_random_movies response
      end

      def parse_and_save_random_movies(unparsed_random_movies)
        parsed_random_movies = unparsed_random_movies.parsed_response
        parsed_random_movies = parsed_random_movies["results"].map do |movie|
          movie_params = {
              title: movie["title"],
              overview: movie["overview"],
              img_path: movie["backdrop_path"]
          }
          Movie.new movie_params
        end

        parsed_random_movies.each do |movie|
          unless movie.save
            render json: {status: 'ERROR', message: 'Movie not added', data: movie.errors}, status: :unprocessable_entity
          end
        end

        parsed_random_movies
      end

    end

  end
end

