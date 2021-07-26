import Foundation
import SwiftUIGeometryUtils


public struct CornerRadiusMap {
    public var topLeading: Double
    public var topTrailing: Double
    public var bottomLeading: Double
    public var bottomTrailing: Double

    
    public init(
        topLeading: Double = .zero,
        topTrailing: Double = .zero,
        bottomLeading: Double = .zero,
        bottomTrailing: Double = .zero
    ) {
        self.topLeading = topLeading
        self.topTrailing = topTrailing
        self.bottomLeading = bottomLeading
        self.bottomTrailing = bottomTrailing
    }
    
    
    public static let zeroed: CornerRadiusMap = .init()
}


extension CornerRadiusMap {
    
    
    /// Initializes a ``PreciselyRoundedRectangle/CornerRadiusMap`` where
    /// the specified corners are set to the same `radius` &mdash;
    /// and unspecified corners are set to a corner radius of `0`.
    public init(corners: [RectangleCorner], radius: Double) {
        self.topLeading = corners.contains(.topLeading) ? radius : .zero
        self.topTrailing = corners.contains(.topTrailing) ? radius : .zero
        self.bottomTrailing = corners.contains(.bottomTrailing) ? radius : .zero
        self.bottomLeading = corners.contains(.bottomLeading) ? radius : .zero
    }
}
