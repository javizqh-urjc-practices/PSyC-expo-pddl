(define (domain recycling_example)
(:requirements :strips :typing :numeric-fluents)


; Types definition
(:types
  location
  robot
  item
)

(:predicates
  (robot_at ?r - robot ?l - location)
  (item_at ?it - item ?l - location)
)

(:functions
  (energy ?r - robot)
  (item_energy ?it - item)
)

; Move action. The robot moves from one location (A) to another (B).
; The only precondition is that the robot must be in the initial location.
; Consequence: The robot is now at B and not at A.
(:action move
  :parameters (?r - robot ?from ?to - location)
  :precondition
    (and 
      (robot_at ?r ?from)
    )
  :effect
    (and
      (robot_at ?r ?to)
      (not (robot_at ?r ?from))
    )
)

(:action eat
  :parameters (?it - item ?l - location ?r - robot)
  :precondition 
    (and
      (item_at ?it ?l)
      (robot_at ?r ?l)
    )
:effect
  (and
    (increase (energy ?r) (item_energy ?it))
    (not (item_at ?it ?l))
  )
)
)
