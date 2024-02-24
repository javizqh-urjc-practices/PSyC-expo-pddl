(define (domain verify_domain)

(:requirements :strips :typing :universal-preconditions)

(:types
    object
)

(:predicates
    (condition ?o - object)
    (verification)
)


(:action verify
    :parameters ()
    :precondition (forall (?obj - object) (condition ?obj))
    :effect (verification)

)

)