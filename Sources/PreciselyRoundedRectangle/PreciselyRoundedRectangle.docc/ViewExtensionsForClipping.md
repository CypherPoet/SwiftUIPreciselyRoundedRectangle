# View Extensions for Clipping

See how the `View.cornerRadius` modifier can be used with `PreciselyRoundedRectangle` shapes.
  

## Overview

Rounded rectangles go perfectly with SwiftUI `View`s's `clipShape` modifier. 

You're free to pass one in directly. However, ``PreciselyRoundedRectangle`` also extends the `cornerRadius` modifier with several unique signatures that act as a bridge between `clipShape`, and the semantic intent of tweaking the radii of the current view.


```swift

extension View {

    public func cornerRadius(
        _ roundings: CornerRadiusMap
    ) -> some View {
        clipShape(PreciselyRoundedRectangle(roundings: roundings))
    }
    
    public func cornerRadius(
        _ corners: [RectangleCorner],
        _ radius: Double
    ) -> some View {
        let roundings = CornerRadiusMap(corners: corners, radius: radius)
        
        return clipShape(PreciselyRoundedRectangle(roundings: roundings))
    }
}

```
