(define (domain verify_domain)

(:requirements :strips :typing :numeric-fluents :equality)

(:types
    object
)

(:predicates
    (verification)
)

(:functions
    (func ?o - object)
)

(:action verify
    :parameters (?o - object)
    :precondition (> (func ?o) 0)
    :effect (and
        (verification)
        (increase (func ?o) 1)
    )
)

)
