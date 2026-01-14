class Mastermind
  COLORS = %w[R G B Y M C] # Red, Green, Blue, Yellow, Magenta, Cyan
  CODE_LENGTH = 4
  MAX_TURNS = 10

  def initialize
    @secret_code = []
    @turns_left = MAX_TURNS
    @history = []
  end

  def start
    setup_game
    print_instructions
    
    loop do
      puts "\n--- Turn #{MAX_TURNS - @turns_left + 1} of #{MAX_TURNS} ---"
      guess = get_player_guess
      
      exact_matches, color_matches = check_guess(guess)
      log_history(guess, exact_matches, color_matches)
      print_board

      if exact_matches == CODE_LENGTH
        puts "\n🎉 CONGRATULATIONS! You cracked the code: #{@secret_code.join}"
        break
      elsif @turns_left == 1
        puts "\n💀 GAME OVER! The code was: #{@secret_code.join}"
        break
      end

      @turns_left -= 1
    end
  end

  private

  def setup_game
    # Generate a random secret code
    @secret_code = Array.new(CODE_LENGTH) { COLORS.sample }
  end

  def print_instructions
    puts "========================================"
    puts "       🔐 RUBY MASTERMIND LEVEL 7       "
    puts "========================================"
    puts "Guess the 4-color code selected from:"
    puts "[R]ed, [G]reen, [B]lue, [Y]ellow, [M]agenta, [C]yan"
    puts "\nFeedback Clues:"
    puts "🔴 (Red Peg)   = Correct Color & Correct Position"
    puts "⚪ (White Peg) = Correct Color but Wrong Position"
    puts "========================================"
  end

  def get_player_guess
    loop do
      print "\nEnter your guess (e.g., RGBY): "
      input = gets.chomp.upcase.chars
      
      if valid_guess?(input)
        return input
      else
        puts "❌ Invalid input! Please enter 4 valid color codes (#{COLORS.join(', ')})."
      end
    end
  end

  def valid_guess?(input)
    input.length == CODE_LENGTH && input.all? { |c| COLORS.include?(c) }
  end

  # The Core Logic (Level 7 Complexity)
  def check_guess(guess)
    exact_matches = 0
    color_matches = 0
    
    # Create temporary copies to avoid modifying original arrays during check
    temp_code = @secret_code.dup
    temp_guess = guess.dup

    # 1. Check for Exact Matches (Red Pegs)
    temp_guess.each_with_index do |color, index|
      if color == temp_code[index]
        exact_matches += 1
        temp_code[index] = nil  # Mark as used
        temp_guess[index] = nil # Mark as handled
      end
    end

    # 2. Check for Color Matches (White Pegs)
    temp_guess.each do |color|
      next if color.nil? # Skip already matched exact ones
      
      if temp_code.include?(color)
        color_matches += 1
        # Remove the first occurrence of this color from temp_code to prevent double counting
        temp_code[temp_code.index(color)] = nil 
      end
    end

    return exact_matches, color_matches
  end

  def log_history(guess, exact, partial)
    @history << { guess: guess, exact: exact, partial: partial }
  end

  def print_board
    puts "\n--- Game Board ---"
    @history.each_with_index do |turn, i|
      guess_str = turn[:guess].join(' ')
      feedback = "🔴 " * turn[:exact] + "⚪ " * turn[:partial]
      puts "Turn #{i + 1}: [ #{guess_str} ]  =>  #{feedback}"
    end
  end
end

# Run the Game
game = Mastermind.new
game.start
