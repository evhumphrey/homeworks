class Simon
  COLORS = %w(red blue green yellow)
  DIFFICULTY = 2

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
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
    @game_over = true unless guess == seq.last

    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    seq.each do |color|
      puts "Simon says: "
      puts "  #{color}"
      sleep(DIFFICULTY)
      system("clear")
    end
  end

  def require_sequence
    system("clear")
    puts "What did Simon say?"
    print "> "
    gets.chomp
  end

  def add_random_color
    @seq << COLORS.shuffle.last
  end

  def round_success_message
    puts "Simon praises your guessing abilities."
    sleep(DIFFICULTY)
  end

  def game_over_message
    puts "Simon knew you couldn't remember it. Game over."
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
  end

  def welcome_message
    puts "Welcome to Simon Says"
  end

  def wait_for_user_ready
    render_welcome_screen

    command = gets.chomp.downcase
    until command == "c"
      render_welcome_screen
      command = gets.chomp.downcase
    end
  end

  def render_welcome_screen
    system("clear")
    welcome_message
    puts "When ready to play, type c"
    print "> "
  end

  private

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
