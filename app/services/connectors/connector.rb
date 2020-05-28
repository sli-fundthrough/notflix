module Connectors
  class Connector

    # By default, connect to MovieDB
    def fetch_movies(page = 1)
      connector = MoviedbConnector.new
      connector.fetch_movies page
    end

    def fetch_movie(movie_id)
      connector = MoviedbConnector.new
      connector.fetch_movie movie_id
    end
  end
end
