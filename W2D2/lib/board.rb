require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2

    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.map.with_index do |cup, cup_idx|
      next if cup_idx == 6 || cup_idx == 13

      cup.concat([:stone, :stone, :stone, :stone])
    end
  end

  def valid_move?(start_pos)
    unless start_pos == 6 || start_pos == 13
      raise "Invalid starting cup"
    end

    true
  end

  def make_move(start_pos, current_player_name)

    hand_of_stones = @cups[start_pos].dup
    @cups[start_pos].clear

    cup_idx = start_pos
    until hand_of_stones.empty?
      cup_idx = (cup_idx + 1) % 14

      if current_player_name == @name1 && cup_idx == 13
        next
      elsif current_player_name == @name2 && cup_idx == 6
        next
      end

      @cups[cup_idx] << hand_of_stones.pop
    end

    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)

    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length > 1
      ending_cup_idx
    else
      :switch
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    empty = Proc.new { |arr| arr.empty? }

    if @cups[0..5].all?(&empty) || @cups[7..12].all?(&empty)
      true
    else
      false
    end
  end

  def winner
  end
end
