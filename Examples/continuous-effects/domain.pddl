(define (domain recycling_example)
(:requirements :strips :typing :durative-actions :continuous-effects :numeric-fluents :equality)


; Types definition
(:types
  location
  robot
  item
)

(:predicates
  (robot_at ?r - robot ?l - location)
  (can-run ?l - location)
)

(:functions
  (oil-level ?r - robot) 
  (fatigue ?r - robot)
  (distance ?from - location ?to - location) 
)

(:constants
  police-station - location
)

; Move action. The robot moves from one location (A) to another (B).
; The only precondition is that the robot must be in the initial location.
; Consequence: The robot is now at B and not at A.
(:durative-action move
  :parameters (?r - robot ?from ?to - location)
  :duration (= ?duration (distance ?from ?to))
  :condition
    (and 
      (at start (robot_at ?r ?from))
      (at start (< (fatigue ?r) 50))
    )
  :effect
    (and
      (at end (robot_at ?r ?to))
      (decrease (oil-level ?r) #t)
      (increase (fatigue ?r) (* 3 #t))
      (at start (not (robot_at ?r ?from)))
    )
)

(:durative-action run
  :parameters (?r - robot ?l - location)
  :duration (= ?duration 5)
  :condition
    (and 
      (over all (< (fatigue ?r) 50))
      (over all (robot_at ?r ?l))
    )
  :effect
    (and
      (decrease (oil-level ?r) (* 5 #t))
      (increase (fatigue ?r) (* 3 #t))
    )
)

(:durative-action drink
  :parameters (?r - robot ?l - location)
  :duration (= ?duration 2)
  :condition
    (and 
      (over all (not(= ?l police-station)))
      (over all (robot_at ?r ?l))
    )
  :effect
    (and
      (decrease (fatigue ?r) (* 5 #t))
      (increase (oil-level ?r) (* 2 #t))
    )
)

)