;
;This is the domain for 2nd question in coursework pddl question
;

(define (domain space)
    (:requirements
        :strips
    )

    (:predicates
        (roverAt ?n ?l)
        (noResults ?x)
        (hasTestResultsRover ?n ?l)
        (hasTestResultsComsat ?l)
        (hasFinalResult ?l)
        (comsatFacingMars)
        (comsatFacingEarth)
        (sendResults ?x ?y)
        (roverMove ?x ?y)
        (test ?r ?l)
        (messageFromComsat ?x)
        (resultSentToComsat)                     
        (marsSite ?x)
    )

;this action moves the rover ?n from location ?l to location ?y
(:action roverMove
    :parameters
        (?n ?l ?y)
    :precondition
        (and
           (roverAt ?n ?l)
           (noResults ?n)
           (marsSite ?y)
        )
    :effect
        (and
           (not(roverAt ?n ?l))
           (roverAt ?n ?y)
           (not (messageFromComsat ?n))
        )
)

;this action lets the rover ?n test soil samples at site ?y
(:action roverTest
    :parameters
        (?n ?y)
    :precondition
        (and
           (messageFromComsat ?n) 
           (roverAt ?n ?y)
           (not (hasTestResultsRover ?n ?y))
           (comsatFacingMars)
           (noResults ?n)
        )
    :effect
        (and
           (hasTestResultsRover ?n ?y)
           (not (noResults ?n))
           (not (messageFromComsat ?n))
        )
)

;this action sends message from rover ?n with samples from site ?y
(:action roverMessage
    :parameters
        (?n ?y)
    :precondition
        (and
           (roverAt ?n ?y)
           (hasTestResultsRover ?n ?y)
           (comsatFacingMars)
        )
    :effect
        (and
           (resultSentToComsat)
           (not (hasTestResultsRover ?n ?y))
           (noResults ?n)
           (hasTestResultsComsat ?y)
        )
)

;this action defines the comsat orientation facing earth with results from site ?l
(:action comsatFaceEarth
   :parameters
        (?l)
    :precondition
        (and
           (comsatFacingMars)
           (resultSentToComsat)
           (hasTestResultsComsat ?l)
        )
    :effect
        (and
           (not (comsatFacingMars))
           (comsatFacingEarth)
        )
)

;this action defines the comsat orientation facing mars
(:action comsatFaceMars
   :parameters
        ()
    :precondition
        (and
           (comsatFacingEarth)
        )
    :effect
        (and
           (not (comsatFacingEarth))
           (comsatFacingMars)

        )
)

;this action sends messages to mission control from site ?c
(:action comsatMessageEarth
    :parameters
        (?c)
    :precondition
        (and
           (comsatFacingEarth)
           (hasTestResultsComsat ?c)
        )
    :effect
        (and
           (hasFinalResult ?c)
           (not (hasTestResultsComsat ?c))
           (noResults ?c)
        )
)

;this action messages from comsat to the rover ?n at site ?x to test soil samples
(:action comsatMessageRover
    :parameters
        (?n ?x)
    :precondition
        (and
           (comsatFacingMars)
           (roverAt ?n ?x)
        )
    :effect
        (and
           (messageFromComsat ?n)
        )
)
)
