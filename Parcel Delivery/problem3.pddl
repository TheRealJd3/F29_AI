;Initial state: the robot is in David Brewster, parcel1 is in Lyell, parcel2 is in David Brewster, parcel3 is in Earl
;Mountbatten, the robot is not wet, it’s not raining, the umbrella is in Earl Mountbatten, the door is closed, and
;the robot is not carrying any parcel nor the umbrella.
;Goal: parcel1 is in Earl Mountbatten, parcel3 is in Lyell, the robot is not wet, the door is open, the robot is not
;holding the umbrella, and the robot is in David Brewster

(define (problem problem2)
  (:domain parcel)

  (:objects
      EarlMountbatten
      DavidBrewester
      Lyell
      parcel1
      parcel2
      parcel3
  )

  (:init
      (robotAt DavidBrewester)
      (parcel parcel1 Lyell)
      (parcel parcel2 DavidBrewester)
      (parcel parcel3 EarlMountbatten)
      (not (raining))
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
      (pathOutdoor DavidBrewester Lyell)

  )

  (:goal
      (and
          (parcel parcel1 EarlMountbatten)
          (parcel parcel3 Lyell)
          (dry)
          (noUmbrella)
          (doorOpen)
          (robotAt DavidBrewester)
      )
  )
)