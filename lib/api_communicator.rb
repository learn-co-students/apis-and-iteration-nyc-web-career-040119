require 'rest-client'
require 'json'
require 'pry'

# HELPER METHODS
def parse(json)
  JSON.parse(json)
end

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = parse(response_string)

=begin
  # iterate over the response hash to find the collection of `films` for the given 'character'
=end
  character_input = response_hash["results"].select { |character| character_name == character["name"] }

=begin
  # Films come back as an array of API links. Need to use RestClient on each link to get film data. An array of hashes in which each hash reps a given film. This collection will be the argument given to `print_movies`
=end

  # character_input.map do |character|
  #   character["films"].map do |film|
  #     JSON.parse(RestClient.get(film))
  #   end
  # end.flatten

  character_input.first["films"].map {|film| parse(RestClient.get(film)) }

end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  # binding.pry
  films.each { |film| puts film["title"] }
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
