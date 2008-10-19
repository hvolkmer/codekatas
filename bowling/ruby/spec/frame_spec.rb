require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + '/../lib/frame'

describe "Frame" do
  
  before(:each) do
    @frame = Frame.new
  end
  
  it "should collect two throws" do
    @frame.add_throw(2)
    @frame.add_throw(4)
  end 

  it "should score the two throws 2 and 6 with 8" do
    @frame.add_throw(2)
    @frame.add_throw(6)
    
    @frame.score.should == 8
  end 
  
  it "should score 0 and 9 with 9" do
    @frame.add_throw(0)
    @frame.add_throw(9)
    
    @frame.score.should == 9
  end

  it "should find scores for first and second throw" do
    @frame.add_throw(2)
    @frame.add_throw(4)
    
    @frame.first_throw.should == 2
    @frame.second_throw.should == 4
  end
  
  it "should recogonize a strike" do
     @frame.add_throw(10)
     @frame.strike?.should == true
  end
  
  it "should recogonize a spare" do
     @frame.add_throw(1)
     @frame.add_throw(9)
     @frame.spare?.should == true
  end
  
  it "should recogonize a difference between spare and strike (spare)" do
     @frame.add_throw(1)
     @frame.add_throw(9)
     @frame.spare?.should == true
     @frame.strike?.should == false
  end

  it "should recogonize a difference between spare and strike (strike)" do
     @frame.add_throw(10)
     @frame.spare?.should == false
     @frame.strike?.should == true
  end
 
  it "should score a strike frame" do
     @frame.add_throw(10)
     next_frame = Frame.new([3,6])
     @frame.score(next_frame).should == 19
  end

  it "should score a spare frame " do
    @frame.add_throw(1)
    @frame.add_throw(9)
    next_frame = Frame.new([3,6])
    @frame.score(next_frame).should == 13
  end
  
  it "should score two strikes in a row" do
     @frame.add_throw(10)
     next_frame = Frame.new([10,0])
     second_next_frame = Frame.new([7,2])
     @frame.score(next_frame,second_next_frame).should == 27
  end
  
  it "should score strike and bonus throws" do
     @frame.add_throw(10)
     next_frame = Frame.new([7,2], true)
     @frame.score(next_frame).should == 19
  end
  
end

describe "simple Game" do
  
  before(:each) do
    @game = Game.new [[1, 5], [3, 6], [7, 2], [3, 6], [4, 4], [5, 3], [3, 3], [4, 5], [8, 1], [2, 6]]
  end
  
  it "should have 10 frames" do
    @game.frames_played.should == 10
  end
  
  it "should have a score of 81" do
    @game.score.should == 81
  end
  
end

describe "Game with strikes" do
  
  it "should score strike game with 2 frames" do
    game = Game.new([[10, 0], [3, 6]])
    game.score.should == 28
  end
  
  it "should score a strike and a spare" do
    game = Game.new([[10, 0],[4, 6],[7, 2]])
    game.score.should == 46
  end
  
  it "should score complete strike and spare game" do
    game = Game.new([[10, 0], [4, 6], [7, 2], [3, 6], [4, 4], [5, 3], [3, 3], [4, 5], [8, 1], [2, 6]])
    game.score.should == 103
  end
  
  it "should score two strikes in a row" do
    game = Game.new([[10, 0],[10, 0],[7, 2]])
    game.score.should == 55
  end
  
  it "should score game with two strikes in a row" do
    game = Game.new([[10, 0],[10, 0],[7, 2],[3, 6],[4, 4],[5, 3],[3, 3],[4,5],[8, 1],[2, 6]])
    game.score.should == 112
  end
  
  it "should score a game with two spares in a row" do
    game = Game.new([[8, 2], [5, 5], [7, 2], [3, 6], [4, 4], [5, 3], [3, 3], [4, 5], [8, 1], [2, 6]])
    game.score.should == 98
  end
  
  it "should score a game with bonus throw" do
    game = Game.new([[1, 5], [3, 6], [7, 2], [3, 6], [4, 4], [5, 3], [3, 3], [4, 5], [8, 1], [2, 8]])
    game.bonus_throw(7)
    game.score.should == 90
  end
  
  it "should score a game with a strike as last throw" do
    game = Game.new([[1, 5], [3, 6], [7, 2], [3, 6], [4, 4], [5, 3], [3, 3], [4, 5], [8, 1], [10, 0]])
    # This is ugly
    game.bonus_throws(7,2)
    game.score.should == 92
  end
  
  it "should score a game with a spare as last throw and a strike as bonus" do
    game = Game.new([[1, 5], [3, 6], [7, 2], [3, 6], [4, 4], [5, 3], [3, 3], [4, 5], [8, 1], [2, 8]])
    game.bonus_throw(10)
    game.score.should == 93
  end
  
  it "should score a perfect game" do
    game = Game.new([[10, 10], [10, 10], [10, 10],[10, 10],[10, 10],[10, 10],[10, 10],[10, 10],[10, 10],[10, 10]])
    game.bonus_throw(10)
    game.bonus_throw(10)
    game.score.should == 300
  end
  
  it "should score a real game" do 
    game = Game.new([[6, 3], [7, 1], [8, 2], [7, 2], [10, 0], [6, 2], [7, 3], [10, 0], [8, 0], [7, 3]])
    game.bonus_throw(10)
    game.score.should == 135
  end
end