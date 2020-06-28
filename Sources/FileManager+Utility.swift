//  Copyright © 2020 Erica Sadun. All rights reserved.

import Foundation

extension FileManager {
    /// Tests whether a path terminates as a folder
    /// - Parameter path: a Finder path
    /// - Returns: `true` for folders/directory, `false` otherwise
    public func pathIsDirectory(_ path: String) -> Bool {
        var isDir: ObjCBool = false
        guard FileManager.default.fileExists(atPath: path, isDirectory: &isDir)
        else { return false }
        return isDir.boolValue
    }
}
