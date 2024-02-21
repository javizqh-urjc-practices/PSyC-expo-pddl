(define (problem example)
(:domain example)

(:objects
  table - location
  bottle newspaper - item
  Bender - robot
)


(:init
  (robot_at Bender table)
  (item_at bottle table)
  (item_at newspaper table)
  (item_at Cake table)
)


(:goal
  (good_robot Bender)
)

)
