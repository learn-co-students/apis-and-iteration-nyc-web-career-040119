require 'rest-client'
require 'json'
require 'pry'

def get_character_data_from_api(character_name)
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  response_hash["results"]
end

def get_movie_urls(character_name)
  #make the web request
  film_urls = []
  get_character_data_from_api(character_name).each do |person|
    if person["name"].downcase == character_name
      film_urls << person["films"]
    end
  end
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
  film_urls
end

def print_movies(film_urls = get_movie_urls(character_name))
  # some iteration magic and puts out the movies in a nice list
  # film_urls = get_character_movies_from_api(character_name)
  film_urls.flatten.each do |url|
    response_string = RestClient.get(url)
    response_hash = JSON.parse(response_string)
    puts response_hash["title"]
    # binding.pry
  end
end
# Luke Skywalker

def show_character_movies(character_name)
  films = get_movie_urls(character_name)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
