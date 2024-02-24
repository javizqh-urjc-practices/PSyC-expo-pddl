(define (domain verify_domain)

(:requirements :strips :typing :equality)

(:types
    object
)

(:predicates
    (verification)
)


(:action verify
    :parameters (?o - object)
    :precondition (= ?o ?o)
    :effect (verification)
)

)