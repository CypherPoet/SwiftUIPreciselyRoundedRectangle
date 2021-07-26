#if canImport(UIKit)

import SwiftUI
import UIKit

extension Path {
    
    /// Initializes a mutable `Path` instance form an immutable `UIBezierPath` shape.
    public init(_ path: UIBezierPath) {
        self.init(path.cgPath)
    }
}

#endif
