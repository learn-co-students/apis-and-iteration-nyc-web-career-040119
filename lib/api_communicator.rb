require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  results = response_hash["results"]
  character_films_urls = []
  characters_films = []
  
  results.each do |character_hash|
    if character_hash["name"].downcase == character_name
      character_films_urls << character_hash["films"]
    end
  end
  character_films_urls = character_films_urls[0]
  #binding.pry
  character_films_urls.each do |film_url|
    #binding.pry
    film_response = RestClient.get(film_url)
    film_response_hash = JSON.parse(film_response)
    characters_films << film_response_hash
  end
  characters_films
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films)
  puts "*" * 20
  films.each do |film_data|
    puts "#{film_data["title"]}"
    puts "*" * 20
  end


  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
