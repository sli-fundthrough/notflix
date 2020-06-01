module Api
  module V1


    class MoviesController < ApplicationController
      # include Secured

      before_action :set_connection

      def index
        page = 1
        params.each do |key, value|
          page = value.to_i if key == 'page' && value.to_i.positive?
        end

        movies = @connector.fetch_movies page

        render json: { status: 'SUCCESS', message: 'Fetched movies', data: movies }, status: :ok
      end

      def show
        movie = @connector.fetch_movie params[:id]
        render json: { status: 'SUCCESS', message: 'Showed movie', data: movie }, status: :ok
      end

      private

      def set_connection
        # @connector = ::Connectors::Connector.new
        @connector = ::Connectors::ConnectionAdapter.new(::Connectors::MoviedbConnector.new)
      end

    end
  end
end

