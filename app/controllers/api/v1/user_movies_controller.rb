module Api
  module V1

    class UserMoviesController < ApplicationController
      include Secured

      def create
        user_movie = UserMovie.new user_movie_params
        if user_movie.save
          render json: { status: 'SUCCESS', message: 'Added user movie', data: user_movie }, status: :ok
        else
          render json: { status: 'ERROR', message: 'User movie not added', data: user_movie.errors }, status: :unprocessable_entity
        end
      end

      def update
        user_movie = UserMovie.find params[:id]
        if user_movie.update_attributes user_movie_params
          render json: { status: 'SUCCESS', message: 'Updated user movie', data: user_movie }, status: :ok
        else
          render json: { status: 'ERROR', message: 'User movie not updated', data: user_movie.errors }, status: :unprocessable_entity
        end
      end

      def user_movie_params
        params.require(:movie_id).permit(:rating, :notes)
      end

    end

  end
end

