module Connectors
  class ConnectionAdapter < Connector

    def initialize(adaptee)
      @adaptee = adaptee
    end

    def fetch_movies(page = 1)
      @adaptee.fetch_movies page
    end

    def fetch_movie(movie_id)
      @adaptee.fetch_movie movie_id
    end
  end
end