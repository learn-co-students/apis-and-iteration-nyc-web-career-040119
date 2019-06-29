require_relative './api_communicator'

def welcome
  # intro = ["It is a dark time for the",
  #          "Rebellion. Although the Death",
  #          "Star has been destroyed,",
  #          "Imperial troops have driven the",
  #          "Rebel forces from their hidden",
  #          "base and pursued them across",
  #          "the galaxy.",
  #          "Evading the dreaded Imperial",
  #          "Starfleet, a group of freedom",
  #          "fighters led by Luke Skywalker",
  #          "has established a new secret",
  #          "base on the remote ice world",
  #          "of Hoth.",
  #          "The evil lord Darth Vader,",
  #          "obsessed with finding young",
  #          "Skywalker, has dispatched",
  #          "thousands of remote probes into",
  #          "the far reaches of space....",
  #        ]
  # intro.each do |line|
  #   puts line
  #   sleep(0.2)
  # end

end

def get_character_from_user
  puts ""
  puts "Please Enter a Character Name:"
  character = gets.chomp
  # use gets to capture the user's input. This method should return that input, downcased.
end
