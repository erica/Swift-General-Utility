//  Copyright © 2020 Erica Sadun. All rights reserved.

import Foundation

infix operator **

extension Numeric where Self: BinaryFloatingPoint {
    /// Exponentiation
    ///
    /// - Parameters:
    ///   - lhs: a `BinaryFloatingPoint` number
    ///   - rhs: a `Double` exponent
    /// - Returns: `lhs` raised to the `rhs` power
    public static func **(lhs: Self, rhs: Double) -> Self {
        Self(pow(Double(lhs), rhs))
    }
    
    /// Exponentiation
    ///
    /// - Parameters:
    ///   - lhs: a `BinaryFloatingPoint` number
    ///   - rhs: an `Int` exponent
    /// - Returns: `lhs` raised to the `rhs` power
    public static func **(lhs: Self, rhs: Int) -> Self {
        Self(pow(Double(lhs), Double(rhs)))
    }
}

extension Numeric where Self: BinaryInteger {
    /// Exponentiation
    ///
    /// - Parameters:
    ///   - lhs: a `BinaryInteger` number
    ///   - rhs: a `Double` exponent
    /// - Returns: `lhs` raised to the `rhs` power
    public static func **(lhs: Self, rhs: Double) -> Self {
        Self(pow(Double(lhs), rhs))
    }
    
    /// Exponentiation
    ///
    /// - Parameters:
    ///   - lhs: a `BinaryInteger` number
    ///   - rhs: an `Int` exponent
    /// - Returns: `lhs` raised to the `rhs` power
    public static func **(lhs: Self, rhs: Int) -> Self {
        Self(pow(Double(lhs), Double(rhs)))
    }
}

