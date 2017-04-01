class Simon
  COLORS = %w(red blue green yellow).freeze
  DIFFICULTIES = ["hard", "medium", "easy"]
  HARD = 0.5
  MEDIUM = 1
  EASY = 2

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
    @difficulty = MEDIUM
  end

  def play
    wait_for_user_ready
    take_turn

    until game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    system("clear")
    show_sequence
    guess = require_sequence
    @game_over = true unless is_correct?(guess)

    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    seq.each do |color|
      puts "Simon says: "
      sleep(0.1) # brief gap between simon saying colors
      puts "  #{color}"
      sleep(@difficulty)
      system("clear")
    end
  end

  def require_sequence
    system("clear")
    puts "What did Simon say? (Enter colors separated by commas)"
    print "> "
    gets.chomp.split(',').map(&:strip)
  end

  def add_random_color
    @seq << COLORS.shuffle.last
  end

  def round_success_message
    puts "Simon praises your guessing abilities. Get ready."
    sleep(EASY)
  end

  def game_over_message
    puts "Simon knew you couldn't remember it."
    puts "You guessed #{sequence_length} colors correctly. Game over"
    puts "Would you like to play again? (y/n)"
    print "> "
  end

  def reset_game
    reset = handle_reset_choice

    if reset
      @sequence_length = 1
      @game_over = false
      @seq = []
      play
    end

    system("clear")
  end

  def welcome_message
    puts "Welcome to Simon Says"
  end

  def wait_for_user_ready
    render_welcome_screen

    command = gets.chomp
    valid_difficulty = DIFFICULTIES.include?(command.downcase)

    until valid_difficulty
      render_welcome_screen
      command = gets.chomp
      valid_difficulty = DIFFICULTIES.include?(command.downcase)
    end

    set_difficulty(command)
  end

  def render_welcome_screen
    system("clear")
    welcome_message
    puts "When ready to play, enter desired difficulty"
    puts "Difficulty can be easy, medium, or hard"
    print "> "
  end

  def is_correct?(array)
    array == seq
  end

  private

  def set_difficulty(word)
    case word
    when "hard"
      @difficulty = HARD
    when "medium"
      @difficulty = MEDIUM
    when "easy"
      @difficulty = EASY
    end
  end

  def handle_reset_choice
    user_choice = gets.chomp
    valid_commands = ["y", "n"]

    until valid_commands.include?(user_choice.downcase)
      puts "Please enter y or n"
      print "> "
      user_choice = gets.chomp
    end

    reset?(user_choice.downcase)
  end

  def reset?(command)
    command == "y" ? true : false
  end
end
