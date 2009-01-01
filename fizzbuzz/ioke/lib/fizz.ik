fizz = fnx("fizzbuzzing it", manumber,
  number = 0
  the_thing = []
  while(number <= manumber,
    fizzing(number, the_thing)
    number++
  )
  the_thing
)

fizzing = fnx("the actual fizzbuzzing", number, array_to_store,
  if(number % 15 == 0 && number != 0,
     array_to_store << "fizzbuzz",
     if(number % 3 == 0 && number != 0,
       array_to_store << "fizz",
       if(number % 5 == 0 && number != 0,
         array_to_store << "buzz",
         array_to_store << number  
         )
       )
     )
)