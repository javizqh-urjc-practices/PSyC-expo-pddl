(define (domain verify_domain)

(:requirements :strips :typing :negative-preconditions)

(:predicates
    (verification)
)


(:action verify
    :parameters ()
    :precondition (not (verification))
    :effect (verification)
)

)