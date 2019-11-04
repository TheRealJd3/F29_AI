;this is the problem defined by us

(define (problem problem4)
  (:domain space)

  (:objects
      rover1
      rover2
      rover3
      site1
      site2
      site3
      site4
      site5
      site6
  )

  (:init
      (comsatFacingMars)    
      (noResults rover1)
      (noResults rover2)
      (noResults rover3)
      (roverAt rover1 site1)
      (roverAt rover2 site2)
      (roverAt rover3 site3)
      (not(hasTestResultsComsat site1))
      (not(hasTestResultsComsat site2))
      (not(hasTestResultsComsat site3))
      (not(hasTestResultsComsat site4))
      (not(hasTestResultsComsat site5))
      (not(hasTestResultsComsat site6))
      (not(hasTestResultsEarth))
      (marsSite site1)
      (marsSite site2)
      (marsSite site3)
      (marsSite site4)
      (marsSite site5)
      (marsSite site6)
  )

  (:goal
      (and
        (hasFinalResult site2)
        (hasFinalResult site4)
        (hasFinalResult site6)
        (comsatFacingEarth) 
        (hasTestResultsRover rover3 site3)
      )
  )
)
