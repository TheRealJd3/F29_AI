;Initial state: rover1 is at site1, rover2 is at site2, comsat is facing mars, rover1 has no test results in its memory,
;rover2 has no test results in its memory.
;Goal: mission control has received the results of soil composition tests at site1, site2, and site3, comsat is facing
;mars, rover1 is at site2, rover2 is at site1.

(define (problem problem2)
  (:domain space)

  (:objects
      rover1
      rover2
      site1
      site2
      site3
  )

  (:init
      (comsatFacingMars)    
      (noResults rover1)
      (noResults rover2)
      (roverAt rover1 site1)
      (roverAt rover2 site2)
      (not(hasTestResultsComsat site1))
      (not(hasTestResultsComsat site2))
      (not(hasTestResultsComsat site3))
      (not(hasTestResultsEarth))
      (marsSite site1)
      (marsSite site2)
      (marsSite site3)
  )

  (:goal
      (and
        (hasFinalResult site1)
        (hasFinalResult site2)
        (hasFinalResult site3)
        (comsatFacingMars) 
        (roverAt rover1 site2)
        (roverAt rover2 site1)
      )
  )
)
