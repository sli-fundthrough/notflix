module Api
  module V1

    class MoviesController < ApplicationController
      def index
        movies = Movie.order 'created_at DESC'
        render json: {status: 'SUCCESS', message: 'Loaded movies', data: movies}, status: :ok
      end

      def create
        movie = Movie.new(movie_params)

        if movie.save
          render json: {status: 'SUCCESS', message: 'Added movie', data: movie}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Movie not added', data: movie.errors}, status: :unprocessable_entity
        end
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

    end

  end
end

