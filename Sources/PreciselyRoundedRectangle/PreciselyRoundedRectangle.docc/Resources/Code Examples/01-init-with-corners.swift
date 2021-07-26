import SwiftUI
import PreciselyRoundedRectangle


struct InitializingWithCornersExample: View {
    let uniqueCornerRoundings = CornerRadiusMap(
        topLeading: 22,
        topTrailing: 12,
        bottomLeading: 8,
        bottomTrailing: 73
    )
    
    let matchingPartialCornerRoundings = CornerRadiusMap(corners: [.topLeading, .bottomTrailing], radius: 54)
    
    
    var body: some View {
        VStack(spacing: 22) {
            Spacer()
            
            PreciselyRoundedRectangle(roundings: uniqueCornerRoundings)
            
            PreciselyRoundedRectangle(roundings: .zeroed)
            
            PreciselyRoundedRectangle(roundings: matchingPartialCornerRoundings)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}



struct InitializingWithCornersExample_Previews: PreviewProvider {
    static var previews: some View {
        InitializingWithCornersExample()
    }
}
