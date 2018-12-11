require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  
  name = response_hash["results"]
  
  new_Array = []
  
  name.each do |single_character|
    if single_character["name"] == character_name
      my_movies << single_character["films"]
      my_movies.each do |movie|
        response_string = RestClient.get movie
        movie_json = JSON.parse response_string
        new_Array << movie_json
      end
    end
  end
  
  new_Array
  
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films)
  final_array = []
  films.each do |film|
    binding.pry
    final_array << film["title"]
  end
  return final_array
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  puts print_movies(films)
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
