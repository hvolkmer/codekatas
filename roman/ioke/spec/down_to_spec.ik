use("ispec")
use("../lib/down_to")

describe(Number,
  describe("downTo",
    it("should count down form 3 to 0",
      a = []
      3 downTo(0, a << "bla")
      a should == ["bla", "bla", "bla"]
    )
  
    it("should count down form 5 to 2",
      a = []
      5 downTo(2, a << "bla")
      a should == ["bla", "bla", "bla"]
    )
  
    it("should count down form 5 to 2",
      a = []
      5 downTo(2, n, a << n )
      a should == [5, 4, 3]
    )
  
    it("should not count down form 3 to 5",
      a = []
      3 downTo(5, n, a << n )
      a should == []
    )
    
  )
)