module Connectors
  class MoviedbConnector
    def fetch_movies(page = 1)
      url = "https://api.themoviedb.org/3/movie/top_rated?page=#{page}&api_key=#{::Rails.application.config.moviedb_api_key}"

      response = HTTParty.get(url)
      parse_movies response
    end

    def fetch_movie(movie_id)
      url = "https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{::Rails.application.config.moviedb_api_key}"
      HTTParty.get(url)
    end

    private

    def parse_movies(unparsed_movies)
      parsed_movies = unparsed_movies.parsed_response

      parsed_movies['results'].map do |movie|
        {
            id: movie['id'],
            title: movie['title'],
            overview: movie['overview'],
            img_path: movie['backdrop_path']
        }
      end
    end
  end
end