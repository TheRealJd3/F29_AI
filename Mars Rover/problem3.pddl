;Initial state: rover1 is at site1, rover2 is at site1, comsat is facing earth, rover1 has no test results in its memory,
;rover2 has no test results in its memory.
;Goal: mission control has received the results of soil composition tests at site1, site2, site3, and site4, comsat
;is facing earth, rover2 has the results of a soil composition test at site5 in its memory.

(define (problem problem3)
  (:domain space)

  (:objects
      rover1
      rover2
      site1
      site2
      site3
      site4
      site5
  )

  (:init
      (comsatFacingEarth)    
      (noResults rover1)
      (noResults rover2)
      (roverAt rover1 site1)
      (roverAt rover2 site1)
      (not(hasTestResultsComsat site1))
      (not(hasTestResultsComsat site2))
      (not(hasTestResultsComsat site3))
      (not(hasTestResultsComsat site4))
      (not(hasTestResultsComsat site5))
      (not(hasTestResultsEarth))
      (marsSite site1)
      (marsSite site2)
      (marsSite site3)
      (marsSite site4)
      (marsSite site5)
  )

  (:goal
      (and
        (hasFinalResult site1)
        (hasFinalResult site2)
        (hasFinalResult site3)
        (hasFinalResult site4)
        (comsatFacingEarth) 
        (hasTestResultsRover rover2 site5)
      )
  )
)
