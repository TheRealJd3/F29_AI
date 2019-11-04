;
;This is the domain for 1st question in coursework pddl question
;
(define (domain parcel)
    (:requirements
        :strips
    )

    (:predicates
        (handEmpty) 
        (holdingParcel) 
        (parcelInHand ?x)
        (robotAt ?l)
        (doorClose)
        (doorOpen)
        (raining)
        (noUmbrella) ;two similar boolean predicates used to avoid confusion
        (pickedUmbrella)
        (parcel ?n ?l)
        (dry)
        (umbrellaAt ?l)
        (pathOutdoor ?x ?y) ;this will be used to define paths outdoors
        (pathIndoor ?x ?y) ;this will be used to define paths indoors
    )

;this action is for picking up parcel ?x from location ?l
(:action pickup
    :parameters
        (?x ?l)
    :precondition
        (and
           (robotAt ?l)
           (parcel ?x ?l)
        )
    :effect
        (and
           (not (handEmpty))
           (not (parcel ?x ?l))
           (robotAt ?l)
           (holdingParcel)
           (parcelInHand ?x)
        )
)

;this action is used to drop parcel at a particular location ?;
(:action drop
    :parameters
        (?n ?l)
    :precondition
        (and
           (robotAt ?l)
           (holdingParcel)
           (parcelInHand ?n)
        )
    :effect
        (and
           (parcel ?n ?l)
           (not (parcelInHand ?n))
           (robotAt ?l)
        )
)

;this action picks up umbrella from location ?l
(:action pickUmbrella
    :parameters
        (?l)
    :precondition
        (and
            (robotAt ?l)
            (noUmbrella)
            (umbrellaAt ?l)
            (raining)
        )    
    :effect
        (and
           (not (noUmbrella))
           (robotAt ?l)
           (pickedUmbrella)
        )
)

;this action is used to moveindoor if door is closed, this opens door and move between rooms indoor
(:action openDoorAndMove
    :parameters
        (?x ?y)
    :precondition
        (and
            (robotAt ?x)
            (holdingParcel)
            (doorClose)
            (pathIndoor ?x ?y)
        )    
    :effect
        (and
           (not (doorClose))
           (not(robotAt ?x))
           (doorOpen)
           (robotAt ?y)
        )
)

;this action describes movement of robot to location ?y from ?x if it is raining and robot is not holding umbrella
(:action moveOutdoorWet
    :parameters
        (?x ?y)
    :precondition
        (and
            (robotAt ?x)
            (pathOutdoor ?x ?y)
            (raining)
            (noUmbrella)
            (dry)
        )    
    :effect
        (and
            (not (robotAt ?x))
            (robotAt ?y)
            (not (dry))
        )
)

;this action describes movement from ?x to ?y with robot holding umbrella
(:action moveOutdoorWithUmbrella
    :parameters
        (?x ?y)
    :precondition
        (and
            (robotAt ?x)
            (pathOutdoor ?x ?y)
            (pickedUmbrella)
        )    
    :effect
        (and
            (not (robotAt ?x))
            (robotAt ?y)
        )
)

;this action is used to move outdoors from ?x to ?y if it is not raining
(:action moveOutdoorNoRain
    :parameters
        (?x ?y)
    :precondition
        (and
            (robotAt ?x)
            (pathOutdoor ?x ?y)
            (noUmbrella)
        )    
    :effect
        (and
            (not (robotAt ?x))
            (robotAt ?y)
        )
)

;this action is used to move indoor from ?x to ?y if door is already open
(:action moveIndoor
    :parameters
        (?x ?y)
    :precondition
        (and
            (robotAt ?x)
            (pathIndoor ?x ?y)
            (doorOpen)
        )    
    :effect
        (and
            (not (robotAt ?x))
            (robotAt ?y)
        )
)


)