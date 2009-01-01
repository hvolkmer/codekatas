use("ispec")
use("../lib/fizz")

describe(Origin,
  
  it("should print fizz for 3",
   fizz(3) should [3] == "fizz"
  )
  
  it("should print buzz for 5",
   fizz(5) should [5] == "buzz"
  )

  it("should print fizzbuzz for 15",
   fizz(15) should == [0, 1, 2,"fizz", 4, "buzz", "fizz", 7, 8, "fizz", "buzz", 11, "fizz", 13, 14, "fizzbuzz"]
  )
)
  