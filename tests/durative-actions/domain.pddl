(define (domain verify_domain)

(:requirements :strips :typing :durative-actions)

(:predicates
    (start)
    (verification)
)

(:durative-action verify
    :parameters ()
    :duration (= ?duration 1)
    :condition (and 
        (at start (start))
    )
    :effect (and 
        (at end (and 
            (verification)
        ))
    )
)



)