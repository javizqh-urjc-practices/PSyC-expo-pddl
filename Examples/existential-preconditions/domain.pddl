(define (domain example)
(:requirements :strips :typing :existential-preconditions :equality)


; Types definition
(:types
  location
  robot
  item
)

(:predicates
  (robot_at ?r - robot ?l - location)
  (item_at ?it - item ?l - location)
  (robot_carry ?r - robot ?it - item)
)

(:constants
  Deposit - location
)

; Move action. The robot moves from one location (A) to another (B).
; The only precondition is that the robot must be in the initial location.
; Consequence: The robot is now at B and not at A.
(:action move
  :parameters (?r - robot ?from ?to - location)
  :precondition
    (and 
      (robot_at ?r ?from)
      (not (= ?to Deposit))
    )
  :effect
    (and
      (robot_at ?r ?to)
      (not (robot_at ?r ?from))
    )
)

; Move action. The robot moves from one location (A) to another (B).
; The only precondition is that the robot must be in the initial location.
; Consequence: The robot is now at B and not at A.
(:action return-base
  :parameters (?r - robot ?from - location)
  :precondition
    (and 
      (robot_at ?r ?from)
      (exists (?it - item)
          (robot_carry ?r ?it)
      )
    )
  :effect
    (and
      (robot_at ?r Deposit)
      (not (robot_at ?r ?from))
    )
)

; Pick-up action. The robot picks an object at a location.
; Both the robot and the object must be in that location.
; Consequences:
;     - The item is no longer at the given location.
;     - The robot is now carrying the object.
(:action pick
  :parameters (?it - item ?l - location ?r - robot)
  :precondition 
    (and 
      (item_at ?it ?l)
      (robot_at ?r ?l)
    )
  :effect
    (and
      (robot_carry ?r ?it)
      (not (item_at ?it ?l))
    )
)
)