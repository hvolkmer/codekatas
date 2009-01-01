use("ispec")
use("../lib/frame")
use("../lib/game")
use("../lib/list")

describe("a simple Game",

  init_game = method(
    Game create([[1, 5], [3, 6], [7, 2], [3, 6], [4, 4], [5, 3], [3, 3], [4, 5], [8, 1], [2, 6]])
  )
 
  it("should have a score of 81",
    game = init_game
    game score should == 81
  )

  it("should have 10 frames",
   game = init_game
   game frames_played should == 10
  )
)

describe("Game with strikes",

  it("should score strike game with 2 frames",
    game = Game create([[10, 0], [3, 6]])
    game score should == 28
  )

  it("should score a strike and a spare",
    game = Game create([[10, 0],[4, 6],[7, 2]])
    game score should == 46
  )

  it("should score complete strike and spare game",
    game = Game create([[10, 0], [4, 6], [7, 2], [3, 6], [4, 4], [5, 3], [3, 3], [4, 5], [8, 1], [2, 6]])
    game score should == 103
  )

  it("should score two strikes in a row",
    game = Game create([[10, 0],[10, 0],[7, 2]])
    game score should == 55
  )

  it("should score game with two strikes in a row",
    game = Game create([[10, 0],[10, 0],[7, 2],[3, 6],[4, 4],[5, 3],[3, 3],[4,5],[8, 1],[2, 6]])
    game score should == 112
  )

  it("should score a game with two spares in a row",
    game = Game create([[8, 2], [5, 5], [7, 2], [3, 6], [4, 4], [5, 3], [3, 3], [4, 5], [8, 1], [2, 6]])
    game score should == 98
  )

  it("should score a game with bonus throw",
    game = Game create([[1, 5], [3, 6], [7, 2], [3, 6], [4, 4], [5, 3], [3, 3], [4, 5], [8, 1], [2, 8]])
    game bonus_throw(7)
    game score should == 90
  )

  it("should score a game with a strike as last throw",
    game = Game create([[1, 5], [3, 6], [7, 2], [3, 6], [4, 4], [5, 3], [3, 3], [4, 5], [8, 1], [10, 0]])
    ;; This is ugly
    game bonus_throws(7,2)
    game score should == 92
  )

  it("should score a game with a spare as last throw and a strike as bonus",
    game = Game create([[1, 5], [3, 6], [7, 2], [3, 6], [4, 4], [5, 3], [3, 3], [4, 5], [8, 1], [2, 8]])
    game bonus_throw(10)
    game score should == 93
  )

  it("should score a perfect game",
    game = Game create([[10, 10], [10, 10], [10, 10],[10, 10],[10, 10],[10, 10],[10, 10],[10, 10],[10, 10],[10, 10]])
    game bonus_throw(10)
    game bonus_throw(10)
    game score should == 300
  )

  it("should score a real game", 
    game = Game create([[6, 3], [7, 1], [8, 2], [7, 2], [10, 0], [6, 2], [7, 3], [10, 0], [8, 0], [7, 3]])
    game bonus_throw(10)
    game score should == 135
  )
)