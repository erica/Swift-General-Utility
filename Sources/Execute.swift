//  Copyright © 2020 Erica Sadun. All rights reserved.

import Foundation

fileprivate extension RuntimeError {
    /// Operation failed
    static let operationError = Self("Unable to perform requested operation")
}

extension Utility {
    
    /// Runs another program as a subprocess, returning any stdout content.
    ///
    /// - Parameters:
    ///   - commandPath: the path to a command to execute
    ///   - arguments: the arguments supplied to the command
    /// - Throws: `RuntimeError`s describing the reason for failure or the contents of `stderr`
    /// - Returns: a string populated by the contents of stdout produced by executing the process.
    public static func execute(commandPath: String, arguments: [String]) throws -> String {
        let commandURL = URL(fileURLWithPath: commandPath)
        guard (try? commandURL.checkResourceIsReachable()) ?? false
            else { throw RuntimeError("Command \(commandPath) not found")  }
        
        // Setup process
        let process = Process()
        if #available(macOS 10.13, *) { process.executableURL = commandURL }
        else { process.launchPath = commandURL.path }
        process.arguments = arguments
        let output = Pipe(); process.standardOutput = output
        let error = Pipe(); process.standardError = error
        
        // Launch
        if #available(macOS 10.13, *) {
            guard (try? process.run()) != nil
                else { throw RuntimeError.operationError }
        } else {
            process.launch()
        }
        process.waitUntilExit()
        
        let outputData = output.fileHandleForReading.readDataToEndOfFile()
        let outputString = String(data: outputData, encoding: .utf8)!.trimmed()
        let errorData = error.fileHandleForReading.readDataToEndOfFile()
        let errorString = String(data: errorData, encoding: .utf8)!.trimmed()
        let status = process.terminationStatus
        guard status == 0 else {
            throw RuntimeError(errorString)
        }
        return outputString
    }
    
    /// Runs another program as a subprocess, returning any stdout content.
    ///
    /// - Parameter command: a command to execute, complete with its arguments in string form.
    /// - Throws: `RuntimeError`s describing the reason for failure or the contents of `stderr`
    /// - Returns: a string populated by the contents of stdout produced by executing the process.
    public static func execute(_ command: String) throws -> String {
        let commandComponents = command.split(separator: " ")
        let arguments = commandComponents.dropFirst().map(String.init)
        let commandPath = String(commandComponents.first!)
        return try execute(commandPath: commandPath, arguments: arguments)
    }
}
