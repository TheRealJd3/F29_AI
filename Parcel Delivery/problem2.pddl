;Initial state: the robot is in Lyell, parcel1 is in Lyell, parcel2 is in David Brewster, it’s raining, the robot is not
;wet, the umbrella is in Earl Mountbatten, the door is closed, and the robot is not carrying any parcel nor the
;umbrella.
;Goal: parcel1 is in Earl Mountbatten, the robot is wet, the robot is holding the umbrella, the door is open, and
;the robot is in Lyell.

(define (problem problem1)
  (:domain parcel)

  (:objects
      EarlMountbatten
      DavidBrewester
      Lyell
      parcel1
      parcel2
  )

  (:init
      (robotAt Lyell)
      (parcel parcel1 Lyell)
      (parcel parcel2 DavidBrewester)
      (raining)
      (dry)
      (umbrellaAt EarlMountbatten)
      (doorClose)
      (handEmpty)
      (noUmbrella)
      (pathOutdoor Lyell EarlMountbatten)
      (pathIndoor EarlMountbatten DavidBrewester)
      (pathIndoor DavidBrewester EarlMountbatten)
      (pathOutdoor EarlMountbatten Lyell)
      (pathOutdoor Lyell DavidBrewester)

  )

  (:goal
      (and
          (parcel parcel1 EarlMountbatten)
          (pickedUmbrella)
          (not (dry))
          (pickedUmbrella)
          (doorOpen)
          (robotAt Lyell)
      )
  )
)