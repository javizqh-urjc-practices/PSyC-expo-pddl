(define (problem recycling_example)
(:domain recycling_example)
; We define 3 different items, 2 types of trash bins, one table and a robot
(:objects
  table floor - location
  organic_trashbin - location
  paper_trashbin - location
  bottle newspaper rotten_apple cake - item
  Bender - robot
)

; Initially everything is on the floor and robot is by the table
(:init

  (= (item_energy bottle) 50)
  (= (item_energy newspaper) 10)
  (= (item_energy rotten_apple) 5)
  (= (item_energy cake) 30)

  (= (energy Bender) 30)

  (robot_at Bender floor)
  (item_at bottle table)
  (item_at newspaper floor)
  (item_at rotten_apple floor)
  (item_at cake table)
)

; The goal is to clean the floor!
(:goal (> (energy Bender) 95)
)

)
