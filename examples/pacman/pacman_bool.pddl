;Header and description

(define (domain pacman_bool)

;remove requirements that are not needed
(:requirements :strips :equality)

; un-comment following line if constants are needed
;(:constants )
;(:types food)
(:predicates 
    (enemy_around)
    (enemy_at_home) 
    (at_home) 
    (at_enemy_land) 
    (food_backpack ?x )  
    (food_at_playground ?x)
    (food_gained ?x)
)

(:functions 
    (total-cost)
)
;define actions here

(:action go_to_enemy_playground
    :parameters ()
    :precondition (and (at_home) )
    :effect (and (not (at_home )) (at_enemy_land ))
)

(:action go_to_enemy
    :parameters ()
    :precondition (and 
        (at_home)
    )
    :effect (and 
        (enemy_around)
        (increase (total-cost) 1)

    )
)

(:action eat_enemy
    :parameters ()
    :precondition (and (at_home ) (enemy_around))
    :effect (and 
    (not (enemy_around))
    (not (enemy_at_home))

    )
)

(:action eat_food
    :parameters (?x )
    :precondition (and (not (enemy_around)) (at_enemy_land ) (food_at_playground ?x ))
    :effect (and 
        (not (food_at_playground ?x))
        (food_backpack ?x)
    )
)
(:action go_home
    :parameters ()
    :precondition (and (at_enemy_land ) )
    :effect (and 
        (not (at_enemy_land ))
        (at_home )
    )
)

(:action unpack_food
    :parameters ()
    :precondition (and (at_home))
    :effect (and 
        (forall 
            (?x ) 
            (when 
                (food_backpack ?x)
                (and 
                    (not (food_backpack ?x))
                    (food_gained ?x)
                )
            ) 
        )
    )
    
    
)


)
