use("ispec")
use("../lib/roman")
use("../lib/down_to")

describe(Number,
  
  it("should convert 1 into I",
    1 toRoman should == "I"
  )
  
 it("should convert 10 into X",
   10 toRoman should == "X"
 )
 
 it("should convert 5 into V",
   5 toRoman should == "V"
 )
 
 it("should convert 50 into L",
   50 toRoman should == "L"
 )
 
 it("should convert 100 into C",
   100 toRoman should == "C"
 )
 
 it("should convert 500 into D",
   500 toRoman should == "D"
 )
 
 it("should convert 2008 into MMVIII",
   2008 toRoman should == "MMVIII"
 )
 
 it("should convert 1990 into MCMXC",
   1990 toRoman should == "MCMXC"
 )
 
 it("should convert 1999 into MCMXC",
   1999 toRoman should == "MCMXCIX"
 )
)
