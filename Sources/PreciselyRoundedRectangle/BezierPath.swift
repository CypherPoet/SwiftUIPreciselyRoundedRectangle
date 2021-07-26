import SwiftUI


#if os(macOS)
typealias BezierPath = NSBezierPath
#else
typealias BezierPath = UIBezierPath
#endif


extension BezierPath {
    
    public convenience init(
        roundedRect rect: CGRect,
        cornerRadiusMap: CornerRadiusMap
    ) {
        #if os(iOS) || os(tvOS) || targetEnvironment(macCatalyst)

        self.init()
        
        let minX = rect.minX
        let minY = rect.minY
        let maxX = rect.maxX
        let maxY = rect.maxY

        let topLeadingRadius = cornerRadiusMap.topLeading
        let topTrailingRadius = cornerRadiusMap.topTrailing
        let bottomLeadingRadius = cornerRadiusMap.bottomLeading
        let bottomTrailingRadius = cornerRadiusMap.bottomTrailing
        
        
        move(to: CGPoint(x: minX + topLeadingRadius, y: minY))
        
        
        addLine(to: CGPoint(x: maxX - topTrailingRadius, y: minY))
        addArc(
            withCenter: CGPoint(x: maxX - topTrailingRadius, y: minY + topTrailingRadius),
            radius: topTrailingRadius,
            startAngle: CGFloat(3 * Double.pi / 2),
            endAngle: 0,
            clockwise: true
        )
        
        addLine(to: CGPoint(x: maxX, y: maxY - bottomTrailingRadius))
        addArc(
            withCenter: CGPoint(x: maxX - bottomTrailingRadius, y: maxY - bottomTrailingRadius),
            radius: bottomTrailingRadius,
            startAngle: 0,
            endAngle: CGFloat(Double.pi / 2),
            clockwise: true
        )
        
        addLine(to: CGPoint(x: minX + bottomLeadingRadius, y: maxY))
        addArc(
            withCenter: CGPoint(x: minX + bottomLeadingRadius, y: maxY - bottomLeadingRadius),
            radius: bottomLeadingRadius,
            startAngle: CGFloat(Double.pi / 2),
            endAngle: CGFloat(Double.pi),
            clockwise: true
        )
        
        addLine(to: CGPoint(x: minX, y: minY + topLeadingRadius))
        addArc(
            withCenter: CGPoint(x: minX + topLeadingRadius, y: minY + topLeadingRadius),
            radius: topLeadingRadius,
            startAngle: CGFloat(Double.pi),
            endAngle: CGFloat(3 * Double.pi / 2),
            clockwise: true
        )
        
        
        close()
        
        
        #elseif os(macOS)

        self.init()

        let minX = rect.minX
        let minY = rect.minY
        let maxX = rect.maxX
        let maxY = rect.maxY
        
        let topLeadingRadius = cornerRadiusMap.topLeading
        let topTrailingRadius = cornerRadiusMap.topTrailing
        let bottomLeadingRadius = cornerRadiusMap.bottomLeading
        let bottomTrailingRadius = cornerRadiusMap.bottomTrailing
        
        
        move(to: NSPoint(x: minX + topLeadingRadius, y: minY))
        
        
        line(to: NSPoint(x: maxX - topTrailingRadius, y: minY))
        appendArc(
            withCenter: NSPoint(x: maxX - topTrailingRadius, y: minY + topTrailingRadius),
            radius: topTrailingRadius,
            startAngle: CGFloat(3 * Double.pi / 2),
            endAngle: 0,
            clockwise: true
        )
        
        
        line(to: NSPoint(x: maxX, y: maxY - bottomTrailingRadius))
        appendArc(
            withCenter: NSPoint(x: maxX - bottomTrailingRadius, y: maxY - bottomTrailingRadius),
            radius: bottomTrailingRadius,
            startAngle: 0,
            endAngle: CGFloat(Double.pi / 2),
            clockwise: true
        )
        
        
        line(to: NSPoint(x: minX + bottomLeadingRadius, y: maxY))
        appendArc(
            withCenter: NSPoint(x: minX + bottomLeadingRadius, y: maxY - bottomLeadingRadius),
            radius: bottomLeadingRadius,
            startAngle: CGFloat(Double.pi / 2),
            endAngle: CGFloat(Double.pi),
            clockwise: true
        )
        
        
        line(to: NSPoint(x: minX, y: minY + topLeadingRadius))
        appendArc(
            withCenter: NSPoint(x: minX + topLeadingRadius, y: minY + topLeadingRadius),
            radius: topLeadingRadius,
            startAngle: CGFloat(Double.pi),
            endAngle: CGFloat(3 * Double.pi / 2),
            clockwise: true
        )
        

        close()

        
        #endif
    }
}
