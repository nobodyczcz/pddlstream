(define 

    (domain domain_name)
    (:requirements :strips :typing :adl :equality)
    (:types 
        animal - object
        cat mouse - animal
    )
    (:predicates 
        (door_open)
        (at_home ?x - animal)
        (at ?x - animal ?l - location)
    )
    (:functions 
        (total-cost)
    )

    (:action catch
        :parameters (?c - cat ?m - mouse)
        :precondition (and (at_home ?m) (at_home ?c))
        :effect (and 
            (not (at_home ?m))
            (increase (total-cost) 3)
        )
    )

    (:action super_catch
        :parameters (?c - cat )
        :precondition (and (at_home ?c))
        :effect (and 
            (forall (?m - mouse) (when (at_home ?m) (not (at_home ?m)) )) 
            (increase (total-cost) 5)
        )
        
    ) 

)


