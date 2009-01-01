Number do(
  toRoman = method(
    "Converts numbers to their roman representation
     Algorithm credit: http://www.geocities.com/oosterwal/computer/roman.html",
    output = ""
    numberOfDigits downTo(0, i,
      magnitude = numberOfDigits - i
      output = lookupRoman(magnitude, getDigitAtPosition(i-1)) + output
    )
  )
  
  lookupRoman = method(
    "Looks up a number in the table",
    line, row,
    romanString = [["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"], 
                 ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"], 
                 ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"], 
                 ["", "M", "MM", "MMM", "MMMM", "", "", "", "", ""]]
    
    romanString[line][row]
  )
  
  getDigitAtPosition = method("gets the digit of the number at given position", position,
    self asText[position..position] toRational
  )
  
  numberOfDigits = method(self asText length)

)
    