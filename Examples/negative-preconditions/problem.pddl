(define (problem example)
(:domain example)

(:objects
  table - location
  Cake newspaper - item
  Bender - robot
)


(:init
  (robot_at Bender table)
  (item_at Cake table)
  (item_at newspaper table)
)


(:goal (and
  (robot_at Bender Deposit)
  (robot_carry Bender Cake)
  )
)

)