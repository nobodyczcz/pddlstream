
(define (problem my_home)
    (:domain domain_name)
    (:objects 
        c1 - cat
        m1 - mouse
        m2 - mouse
    )
    (:init 
        (at_home c1)
        (at_home m1)
        (at_home m2)
        (= (total-cost) 0)
    )

    (:goal (And
        (not (at_home m1))
        (not (at_home m2))
    ))
    (:metric minimize (total-cost))
)