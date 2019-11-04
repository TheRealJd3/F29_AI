;Initial state: rover1 is at site1, comsat is facing earth, rover1 has no test results in its memory.
;Goal: mission control has received the results of a soil composition test at site2.

(define (problem problem1)
  (:domain space)

  (:objects
      rover1
      site1
      site2
  )

  (:init
      (comsatFacingEarth)    
      (noResults rover1)
      (roverAt rover1 site1)
      (not(hasTestResultsComsat site1))
      (not(hasTestResultsComsat site2))
      (not(hasTestResultsRover))
      (marsSite site2)
  )

  (:goal
      (and
        (hasFinalResult site2)
        (roverAt rover1 site2)
      )
  )
)
