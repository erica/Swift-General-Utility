//  Copyright © 2020 Erica Sadun. All rights reserved.

import Foundation

postfix operator •?

/// Prints the value of the item, passes it through, suitable for condition cascades and method chaining.
public postfix func •?<T>(lhs: T) -> T {
    print(lhs)
    return lhs
}

extension Utility {
    /// Applies the closure, and returns true so the closure can be executed in a cascading condition.
    /// - Parameter closure: a side effect to apply to the current instance.
    public static func sideEffect(_ closure: () -> Void) -> Bool {
        closure()
        return true
    }
}
