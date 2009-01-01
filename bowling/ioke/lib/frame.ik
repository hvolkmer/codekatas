Frame = Origin mimic
Frame do(
  throws = []
  throw_count = 0
  bonus_throw = false
 
  create = method("Initializes the frame with throws", given_throws [0,0], bonus false,
    new_frame = Frame mimic
    new_frame throws = given_throws
    new_frame throw_count = 0
    new_frame bonus_throw = bonus
    new_frame
  )

  addThrow = method("Add a throw to the frame", score_value,
    self throws[throw_count] = score_value
    self throw_count += 1
   )

  score = method("Score the frame", next_frame nil, second_next_frame nil,
    if(bonus_throw, 
      0,
      if(strike? && next_frame && next_frame strike? && second_next_frame,
       20 + second_next_frame first_throw,
       if(strike? && next_frame,
         10 + next_frame first_throw + next_frame second_throw,
         if(spare? && next_frame,
           10 + next_frame first_throw,
           throws inject(+)
           )
         )
       )
     )
  )

  first_throw = method("retuns value of first throw", 
    throws[0]
  )

  second_throw = method("returns value of second throw",
    throws[1]
  )

  strike? = method("tells if first throw is a strike",
    throws[0] == 10
  )

  spare? = method("tells if first throw is a spare",
    !strike? && (first_throw + second_throw) == 10
  )
)