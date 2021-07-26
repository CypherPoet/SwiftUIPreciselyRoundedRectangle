import SwiftUI
import SwiftUIGeometryUtils


extension View {

    /// Clips a `View` with a ``PreciselyRoundedRectangle`` `Shape`, using the specified
    /// radius measurements from the provided ``PreciselyRoundedRectangle/CornerRadiusMap``.
    public func cornerRadius(
        _ roundings: CornerRadiusMap
    ) -> some View {
        clipShape(PreciselyRoundedRectangle(roundings: roundings))
    }
    
    
    /// Clips a `View` with a ``PreciselyRoundedRectangle`` `Shape`, using the specified
    /// radius measurement for each specified `RectangleCorner`.
    ///
    /// > Note: Unspecified corners will have a rounding of `0`.
    public func cornerRadius(
        _ corners: [RectangleCorner],
        _ radius: Double
    ) -> some View {
        let roundings = CornerRadiusMap(corners: corners, radius: radius)
        
        return clipShape(PreciselyRoundedRectangle(roundings: roundings))
    }
}
