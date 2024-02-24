(define (domain verify_domain)

(:requirements :strips :typing :existential-preconditions)

(:types
    object
)

(:predicates
    (condition ?o - object)
    (verification)
)


(:action verify
    :parameters ()
    :precondition (exists (?obj - object) (condition ?obj))
    :effect (verification)

)

)