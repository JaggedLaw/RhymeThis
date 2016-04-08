require 'net/http'
require 'json'

def get_rhymes
  puts "Enter the word you want to rhyme with: "
  rhyme_word = gets.chomp.downcase
  all_rhymes = JSON.parse(Net::HTTP.get("rhymebrain.com", "/talk?function=getRhymes&word=#{rhyme_word}"))

  potential_rhymes = all_rhymes.select {|rhyme| rhyme["score"] == 300 && rhyme["freq"] > 18}.map {|rhyme| rhyme["word"]}

  if potential_rhymes.empty?
    puts "Nothing rhymes with #{rhyme_word}!"
  else
    puts potential_rhymes.join(", ")
  end
end


puts "Welcome to RhymeThis!"
play_again = true

while play_again
  puts "Would you like help rhyming a word? (Y)es?"
  help = gets.chomp.downcase[0]
  if help == 'y'
    get_rhymes
  end

  puts "Player 1, give your two rhyming words: "
  rhyme = gets.chomp.downcase

  puts "Player 1, give your clue: "
  clue = gets.chomp.downcase

  solved = false
  puts "The clue is: #{clue}."

  until solved == true
    puts "Player 2, what is your guess?"
    guess = gets.chomp.downcase

    if guess == rhyme
      puts "You guessed the right ryhme!"
      solved = true
    else
      puts "Nope. Guess again..."
    end
  end

  puts "Do you want to play again? (y)es or (n)o?"
  answer = gets.chomp.downcase[0]
  play_again = false if answer == 'n'
end
