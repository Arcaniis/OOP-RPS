# Building Rock, Paper, Scissors. Program asks player to select rock paper or
# scissors. Program then has computer select rock, paper, or scissors randomly.
# Then program compares the two and based on the selections, chooses a winner.
# Program then declares a winner and asks player if they wish to play again.

# Player, rock, paper, scissors, computer
# compare, choose winner, play again?

class Player
  attr_accessor :name, :choice

  def initialize(n)
    self.name = n
  end

  def pick_hand
    begin
      puts "Choose one: (R/P/S)"
      hand = gets.chomp.downcase
    end until ['r', 'p', 's'].include?(hand)
    if hand == 'r'
      self.choice = 'Rock'
    elsif hand == 'p'
      self.choice = "Paper"
    else
      self.choice = "Scissors"
    end
  end

  def to_s
    "#{name} picked #{choice}"
  end

end

class Computer
  attr_accessor :name, :choice
  
  def initialize(n)
    self.name = n
  end

  def pick_hand
    choices = ["Paper", "Rock", "Scissors"]
    self.choice = choices.sample
  end

  def to_s
    "#{name} picked #{choice}"
  end

end


class Game
  attr_accessor :player, :computer

  def initialize(n)
    self.player = Player.new(n)
    self.computer = Computer.new('Computer')
  end

  def system_clear
    system('cls')
    system('clear')
  end

  def decide_winner
    if player.choice == computer.choice
      puts "It's a Tie!"
    elsif (player.choice == 'Rock' && computer.choice == 'Scissors') || (player.choice == 'Scissors' && computer.choice == 'Paper') || (player.choice == 'Paper' && computer.choice == 'Rock')
      puts "#{player.name} Wins!"
    else
      puts "#{computer.name} Wins!"
    end
  end

  def play_again?
  play_again = nil
  
  begin 
    puts "Play again? (Y/N)"
    play_again = gets.chomp.downcase
  end until play_again == 'y' || play_again == 'n'

  if play_again == 'y'
    system_clear
    Game.new(player.name).play
  end
end

  def play
    system_clear
    player.pick_hand
    computer.pick_hand
    system_clear
    puts player
    puts computer
    puts "-----"
    decide_winner
    puts "-----"
    play_again?
  end
end

puts "Please enter your name:"
Game.new(gets.chomp).play