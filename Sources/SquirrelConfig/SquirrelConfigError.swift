//
//  SquirrelConfigError.swift
//  SquirrelConfig
//
//  Created by Filip Klembara on 10/16/17.
//

import SquirrelCore
import PathKit

/// Config error
public struct SquirrelConfigError: SquirrelError {
    /// Error kinds
    ///
    /// - missingConfigFile: File is missing or wrong permissions
    /// - noRoot: No root node for yaml
    public enum ErrorKind {
        case missingConfigFile(path: Path)
        case noRoot
    }

    /// Error kind
    public let kind: ErrorKind

    /// custom description
    private var _description: String?

    /// Constructs error
    ///
    /// - Parameters:
    ///   - kind: Error kind
    ///   - description: Error custom description
    init(kind: ErrorKind, description: String? = nil) {
        self.kind = kind
        _description = description
    }

    /// Description
    public var description: String {
        var desc: String
        switch kind {
        case .noRoot:
            desc = "Could not get root node from config file"
        case .missingConfigFile(let path):
            desc = "File (\(path.absolute().string)) "
                + "does not exists or you don't have permissions for read"
        }
        if let customDesc = _description {
            desc += ", Description: \(customDesc)"
        }
        return desc
    }
}
