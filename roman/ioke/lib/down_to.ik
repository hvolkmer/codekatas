Number do(
  downTo = dmacro("loop from self down to given number
   There two versions of this macro:
   3 downTo(1, 'Looping' println) which yields
   Looping
   Looping
   Looping
   3 downTo(1, n, n println) which yields
   3
   2
   1",
  
    [>number, code] 
      (self - number) times(code evaluateOn(call ground)),
      
    [>number, variable, code] 
      code = LexicalBlock createFrom([variable, code], call ground)
      (self - number) times(n,
        reverseLoopCount = self - n
        code call(cell(:reverseLoopCount))
      )
  )

) 