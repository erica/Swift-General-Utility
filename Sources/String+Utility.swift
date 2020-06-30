//  Copyright © 2020 Erica Sadun. All rights reserved.

import Foundation

// MARK: - General Utility -

extension String {
    /// Returns a new string made by removing from both ends of the receiver characters contained
    /// in the whitespaces and new line character set.
    public func trimmed() -> String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
