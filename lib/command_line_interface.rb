def welcome
  puts "Welcome!"
end

def get_character_from_user
  puts "Please enter a character name:"
  input = gets.chomp

  # use gets to capture the user's input. This method should return that input, downcased.
  puts "...I've got a bad feeling about this..."
  input.downcase
end
