//  Copyright © 2020 Erica Sadun. All rights reserved.

import Foundation

/// Enables fluent side-effects by inserting passthrough into call chains.
public protocol Applicative {}

extension Applicative {
    /// Applies the closure and passes through the instance.
    /// - Parameter closure: a side effect to apply to the current instance.
    /// - Returns: the receiving instance.
    public func applying(_ closure: (_ instance: Self) -> Void) -> Self {
        closure(self)
        return self
    }
}

