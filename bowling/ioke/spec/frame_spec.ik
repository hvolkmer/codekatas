use("ispec")
use("../lib/frame")
use("../lib/game")
use("../lib/list")

describe(Frame,
  it("should collect two throws",
    frame = Frame create
    frame addThrow(2)
    frame addThrow(4)
   )
   
 it("should score the two throws 2 and 6 with 8",
   frame = Frame create

   frame addThrow(2)
   frame addThrow(6)

   frame score should == 8
  )

  it("should score 0 and 9 with 9",
    frame = Frame create
    frame addThrow(0)
    frame addThrow(9)

    frame score should == 9
  )

  it("should find scores for first and second throw",
    frame = Frame create
    frame addThrow(2)
    frame addThrow(4)

    frame first_throw should == 2
    frame second_throw should == 4
  )

  it("should recogonize a strike",
    frame = Frame create
    frame addThrow(10)
    frame strike? should be true
  )

  it("should recogonize a spare",
    frame = Frame create
    frame addThrow(1)
    frame addThrow(9)
    frame spare? should be true
  )

  it("should recogonize a difference between spare and strike (spare)",
    frame = Frame create
    frame addThrow(1)
    frame addThrow(9)
    frame spare? should be true
    frame strike? should be false
  )

  it("should recogonize a difference between spare and strike (strike)",
    frame = Frame create
    frame addThrow(10)
    frame spare? should be false
    frame strike? should be true
  )

  it("should score a strike frame",
    frame = Frame create
    frame addThrow(10)
    next_frame = Frame create([3,6])
    frame score(next_frame) should == 19
  )

  it("should score a spare frame ",
   frame = Frame create
   frame addThrow(1)
   frame addThrow(9)
   next_frame = Frame create([3,6])
   frame score(next_frame) should == 13
  )

  it("should score two strikes in a row",
    frame = Frame create
    frame addThrow(10)
    next_frame = Frame create([10,0])
    second_next_frame = Frame create([7,2])
    frame score(next_frame,second_next_frame) should == 27
  )

  it("should score strike and bonus throws",
    frame = Frame create
    frame addThrow(10)
    next_frame = Frame create([7,2], true)
    frame score(next_frame) should == 19
  )
)