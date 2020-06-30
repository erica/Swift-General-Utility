//  Copyright © 2020 Erica Sadun. All rights reserved.

import Foundation

/// A stringity error type representing runtime errors.
public struct RuntimeError: Error, CustomStringConvertible {
    
    /// Stringity description
    public var description: String
    
    /// Create from string
    ///
    /// - Parameter description: A string description of a runtime error condition
    public init(_ description: String) {
        self.description = description
    }
}
