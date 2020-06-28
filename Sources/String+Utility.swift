//  Copyright © 2020 Erica Sadun. All rights reserved.

import Foundation

// MARK: - General Utility -

extension String {
    /// Returns a new string made by removing from both ends of the receiver characters contained
    /// in the whitespaces and new line character set.
    func trimmed() -> String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /// Returns boolean indicating whether a string-based path is a directory
    func isDir() -> Bool {
        var pathIsDir: ObjCBool = false
        guard FileManager.default.fileExists(atPath: self, isDirectory: &pathIsDir)
        else { return false }
        return pathIsDir.boolValue
    }
}
