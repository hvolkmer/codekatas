Game = Origin mimic
Game do(
  
  create = method(
    "Initializes the frame with throws", array_of_throws [],
    new_game = Game mimic
    new_game frames = []
    array_of_throws each(one_throw, new_game add_throw_for_frame(one_throw))
    new_game
  )

  add_throw_for_frame = method(
    "Add one frame to the game", array,
    frames << Frame create(array)
  )

  frames_played = method(
    "returns the count of frames played",
    frames size
  )

  score = method(
    "Score the game",
    second_next_frame = Frame create. next_frame = Frame create
    frames reverse inject(0, sum, current_frame,
      sum += current_frame score(next_frame, second_next_frame)
      second_next_frame = next_frame
      next_frame = current_frame
      sum
    )
  )

  bonus_throw = method(score,
    frames << Frame create([score,0], true)
  )

  bonus_throws = method(score_one, score_two,
    frames << Frame create([score_one, score_two], true)
  )
)