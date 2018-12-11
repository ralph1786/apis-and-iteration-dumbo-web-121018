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
      character_movies << single_character["films"]
      character_movies.each do |movie|
        response_string = RestClient.get movie
        movie_json = JSON.parse response_string
        new_Array << movie_json
      end
    end
  end
  binding.pry
  
  new_Array
  
end

def print_movies(films)
  final_array = []
  films.each do |film|
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
