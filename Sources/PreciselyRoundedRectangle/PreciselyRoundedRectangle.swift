import SwiftUI


/// A rounded rectangle shape capable of applying unique roundings (AKA corner radii) to
/// each corner.
public struct PreciselyRoundedRectangle {
    public var cornerRadiusMap: CornerRadiusMap
    
    public init(
        roundings cornerRadiusMap: CornerRadiusMap = .zeroed
    ) {
        self.cornerRadiusMap = cornerRadiusMap
    }
}


// MARK: - Shape
extension PreciselyRoundedRectangle: Shape {
    
    public func path(in rect: CGRect) -> Path {
        let basePathShape = BezierPath(
            roundedRect: rect,
            cornerRadiusMap: cornerRadiusMap
        )
        .cgPath
        
        return Path(basePathShape)
    }
}


// MARK: - AnimatableData
extension PreciselyRoundedRectangle: Animatable {
    
    private var animatableData: CornerRadiusMap {
        get { cornerRadiusMap }
        set { cornerRadiusMap = newValue }
    }
}



#if DEBUG

// MARK: - Previews

struct PreciselyRoundedRectangle_Previews: PreviewProvider {
    
    static let uniqueCornerRoundings = CornerRadiusMap(
        topLeading: 22,
        topTrailing: 12,
        bottomLeading: 8,
        bottomTrailing: 73
    )
    
    static let matchingPartialCornerRoundings = CornerRadiusMap(corners: [.topLeading, .bottomTrailing], radius: 54)
    
    
    static var previews: some View {
        VStack(spacing: 22) {
            Spacer()
            
            PreciselyRoundedRectangle(roundings: uniqueCornerRoundings)
            
            PreciselyRoundedRectangle(roundings: .zeroed)
            
            PreciselyRoundedRectangle(roundings: matchingPartialCornerRoundings)
            
            Spacer()
        }
        .preferredColorScheme(.dark)
        .padding(.horizontal)
    }
}

#endif
