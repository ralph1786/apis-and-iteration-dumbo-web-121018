def welcome
  puts "Welcome to the Star Wars Universe!"
end

def get_character_from_user
  puts "please enter a character name"
  user_input = gets.chomp().downcase
  user_input
end
