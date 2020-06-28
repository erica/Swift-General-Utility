//  Copyright © 2020 Erica Sadun. All rights reserved.

import Foundation

extension MutableCollection {
    /// Reorders the elements of a collection such that all the elements
    /// that match a given predicate are after all the elements that don't match.
    ///
    /// - Parameter belongsInSecondPartition: A predicate used to partition the collection.
    ///   All elements satisfying this predicate are ordered after all elements not satisfying it.
    /// - Returns: Slices representing the matching and non-matching partitions.
    public mutating func partitionSplit(by belongsInSecondPartition: (Self.Element) throws -> Bool) rethrows -> (matching: SubSequence, notMatching: SubSequence) {
        let idx = try self.partition(by: belongsInSecondPartition)
        return (matching: self[..<idx], notMatching: self[idx...])
    }
}
