//  Copyright © 2020 Erica Sadun. All rights reserved.

import Foundation

extension BinaryFloatingPoint {
    /// Apply schoolbook rounding to return `self` to n places.
    ///
    /// - Parameter places: The number of places to retain
    /// - Returns: A rounded version `self`
    public func rounding(places: Int) -> Self {
        let factor = Self.init(10.0 ** Double(places))
        return Self(Foundation.round(Double(self * factor))) / factor
    }
}

extension String.StringInterpolation {
    
    /// Provide floating point interpolation with rounding
    /// - Parameters:
    ///   - places: The number of places to round to, using schoolbook rounding.
    ///   - literal: A floating point value.
    public mutating func appendInterpolation<T: BinaryFloatingPoint>(_ value: T, roundingPlaces places: Int) {
        appendLiteral("\(value.rounding(places: places))")
    }
}
