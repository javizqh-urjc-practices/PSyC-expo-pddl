(define (problem recycling_example)
(:domain recycling_example)
; We define 3 different items, 2 types of trash bins, one table and a robot
(:objects
  party park - location
  bottle newspaper rotten_apple - item
  Bender - robot
)

; Initially everything is on the floor and robot is by the table
(:init
  (= (distance party park) 30)
  (= (distance park party) 30)
  (= (distance park police-station) 20)
  (= (distance police-station park) 20)
  (= (distance party police-station) 50)
  (= (distance police-station party) 50)

  (robot_at Bender party)
  (= (oil-level Bender) 200)
  (= (fatigue Bender) 20)
  (can-run park)
)

; The goal is to clean the floor!
(:goal (and
    (robot_at Bender police-station)
    (< (oil-level Bender) 100)
  )
)

)