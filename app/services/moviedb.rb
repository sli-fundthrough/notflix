require 'open-uri'

module MovieDB
  api_key = '3026c04c29acb3e523e35359a8564812'

  def self.fetch_random_movie
    render json: { message: 'Hello from MovieDB' }
  end

end