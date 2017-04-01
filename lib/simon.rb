class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    guess = require_sequence
    @game_over = true unless guess == seq.last

    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    print "Simon says: "
    add_random_color
    puts seq.last
  end

  def require_sequence
    puts "What did simon say?"
    print "> "
    gets.chomp
  end

  def add_random_color
    @seq << COLORS.shuffle.last
  end

  def round_success_message

  end

  def game_over_message

  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
