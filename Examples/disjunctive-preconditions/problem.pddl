(define (problem example)
(:domain example)

(:objects
  table floor - location
  bottle - item
  Bender Aspiradoras - robot
)


(:init
  (robot_at Bender table)
  (gripper_free Bender)
  (robot_at Aspiradoras floor)
  (gripper_free Aspiradoras)
  (robot_tall Bender)
  (robot_vacuum Aspiradoras)
  (is-high table)
  (is-low floor)
  (item_at bottle table)
)


(:goal
  (robot_carry Aspiradoras bottle)
)

)
