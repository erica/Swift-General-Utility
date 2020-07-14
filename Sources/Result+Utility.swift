//  Copyright © 2020 Erica Sadun. All rights reserved.

import Foundation

extension Result where Success == Data, Failure: Error {
    /// Initializes a `Result` from a completion handler's `(data?, error?)`.
    ///
    /// When both data and error are non-nil, `Result` first populates the
    /// `.failure` member over the `success`.
    ///
    /// - Parameters:
    ///   - data: the optional data returned via a completion handler
    ///   - error: the optional error returned via a completion handler
    public init(_ data: Data?, _ error: Failure?, fallbackError: Failure = Result.defaultFallbackError() as! Failure) {
        precondition(!(data == nil && error == nil))
        switch (data, error) {
        case (_, let failure?): self = .failure(failure)
        case (let success?, _): self = .success(success)
        default: self = .failure(fallbackError)
        }
    }
    
    static public func defaultFallbackError() -> Error {
        let userInfo: [String : Any] =
            [
                "NSLocalizedDescriptionKey" :
                    NSLocalizedString("Cannot initialize `Result` with nil data and nil error", comment: ""),
                "NSLocalizedFailureReasonErrorKey" :
                    NSLocalizedString("Cannot initialize `Result` with nil data and nil error", comment: "")
            ]
        return NSError(domain: "com.ericasadun.SwiftGeneralUtility",
                       code: NSURLErrorBadServerResponse,
                       userInfo: userInfo)
    }
}
