(define (domain verify_domain)

(:requirements :strips :typing :conditional-effects)

(:predicates
    (condition)
    (verification)
)


(:action verify
    :parameters ()
    :precondition ()
    :effect (when (condition) (verification))
)

)