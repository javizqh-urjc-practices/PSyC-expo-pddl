(define (domain verify_domain)

(:requirements :strips :typing :disjunctive-preconditions)

(:predicates
    (verification)
    (predicate2)
    (predicate1)
)


(:action verify
    :parameters ()
    :precondition (or (predicate1) (predicate2))
    :effect (verification)
)

)