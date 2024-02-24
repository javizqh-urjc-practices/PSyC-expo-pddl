(define (domain verify_domain)

; Not necesary implementing :action-expansions for working
(:requirements :strips :typing)

(:types
    type1
    type2
)

(:predicates
    (verification1)
    (verification2)
)


(:action verify
    :parameters (?t1 - type1)
    :precondition ()
    :effect (verification1)
)

(:action verify
    :parameters (?t2 - type2)
    :precondition ()
    :effect (verification2)
)

)