;This is the problem defined by us 

(define (problem problem4)
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
      (robotAt Lyell)
      (parcel parcel1 DavidBrewester)
      (parcel parcel2 Lyell)
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
          (parcel parcel1 Lyell)
          (parcel parcel3 DavidBrewester)
          (parcel parcel2 EarlMountbatten)
          (dry)
          (noUmbrella)
          (doorOpen)
          (robotAt Lyell)
      )
  )
)