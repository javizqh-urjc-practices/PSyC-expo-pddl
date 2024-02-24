(define (domain verify_domain)

; Not necesary implementing :action-expansions for working
(:requirements :strips :typing :derived-predicates)

(:types
    object
)

(:predicates
    (axiom ?x - object)
    (verification)
    (condition ?x - object)
)

(:derived (condition ?x - object)
    (axiom ?x)
)

(:action verify
    :parameters (?x - object)
    :precondition (condition ?x)
    :effect (verification)
)


)