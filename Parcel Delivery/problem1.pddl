;Initial state: the robot is in Earl Mountbatten, parcel1 is in David Brewster, it’s raining, the robot is not wet, the
;umbrella is in Earl Mountbatten, and the robot is not carrying any parcel nor the umbrella.
;Goal: parcel1 is in Lyell, the robot is not wet, and the robot is holding the umbrella

(define (problem problem1)
  (:domain parcel)

  (:objects
      EarlMountbatten
      DavidBrewester
      Lyell
      parcel1
  )

  (:init
      (handEmpty)
      (robotAt EarlMountbatten)
      (parcel parcel1 DavidBrewester)
      (dry)
      (doorOpen)
      (raining)
      (umbrellaAt EarlMountbatten)
      (pathOutdoor Lyell EarlMountbatten)
      (pathIndoor EarlMountbatten DavidBrewester)
      (pathIndoor DavidBrewester EarlMountbatten)
      (pathOutdoor EarlMountbatten Lyell)
      (pathOutdoor Lyell DavidBrewester)
      (pathOutdoor DavidBrewester Lyell)
      (noUmbrella)
  )

  (:goal
      (and
          (parcel parcel1 Lyell)
          (pickedUmbrella)
          (dry)
      )
  )
)
