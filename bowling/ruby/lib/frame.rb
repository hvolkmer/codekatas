class Frame

  
  def initialize(throws = [0,0], bonus = false)
    @score = 0
    @throws = throws
    @throw_count = 0
    @bonus_throw = bonus
  end
  
  def add_throw(score)
    @throws[@throw_count] = score
    @throw_count += 1
  end
  
  def score(next_frame = nil, second_next_frame = nil)
    if @bonus_throw
      0
    elsif strike? && next_frame && next_frame.strike? && second_next_frame
      20 + second_next_frame.first_throw
    elsif strike? && next_frame
      10 + next_frame.first_throw + next_frame.second_throw
    elsif spare? && next_frame
      10 + next_frame.first_throw 
    else
      @throws.inject(0) { |current, next_value| current += next_value } 
    end
  end
  
  def first_throw
    @throws[0]
  end
  
  def second_throw
    @throws[1]
  end
  
  def strike?
    @throws[0] == 10
  end

  def spare?
    !strike? && (first_throw + second_throw) == 10
  end

end

class Game
  
  def initialize(array_of_throws = [])
    @frames = []
    array_of_throws.each do |one_throw|
       add_throw_for_frame(one_throw)
     end
  end
  
  def add_throw_for_frame(array)
    @frames << Frame.new(array)
  end
  
  def score
    second_next_frame, next_frame = Frame.new, Frame.new
    @frames.reverse.inject(0) do |sum, current_frame|
      sum += current_frame.score(next_frame, second_next_frame)
      second_next_frame = next_frame
      next_frame = current_frame
      sum
    end
  end
  
  def bonus_throw(score)
    @frames << Frame.new([score,0], true)
  end
  
  def bonus_throws(score_one, score_two)
    @frames << Frame.new([score_one, score_two], true)
  end
  
  def frames_played
    @frames.size
  end
end