//  Copyright © 2020 Erica Sadun. All rights reserved.

import Foundation

extension Utility {
    /// Creates and executes a non-blocking URLSession data task.
    /// - Parameter request: the `URLRequest` for the session.
    /// - Parameter completion: A closure to execute asynchronously when the data task completes.
    /// - Returns: The retrieved session data.
    public static func requestAsynchronousData(_ request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) -> Void {
        let task = URLSession.shared.dataTask(with: request) { data, _, error -> Void in
            completion(Result(data, error))
        }
        task.resume()
    }

    /// Creates and executes a blocking URLSession data task.
    /// - Parameter request: the `URLRequest` for the session.
    /// - Throws: Any returned error on `Result.get`.
    /// - Returns: The retrieved session data.
    public static func requestSynchronousData(_ request: URLRequest) throws -> Data {
        let semaphore = DispatchSemaphore(value: 0)
        var received: Result<Data, Error> = Result(Data(), nil)
        let completion = { (result: Result<Data, Error>) -> Void in
            received = result
            _ = semaphore.signal()
        }
        requestAsynchronousData(request, completion: completion)
        let _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        return try received.get()
    }
}
