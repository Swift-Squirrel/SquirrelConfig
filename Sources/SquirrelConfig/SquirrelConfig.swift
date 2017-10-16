//
//  SquirrelConfig.swift
//  SquirrelConfig
//
//  Created by Filip Klembara on 10/16/17.
//

import PathKit
import Yams

/// Shared config file
public class SquirrelConfig {

    /// Shared config
    public static var shared: SquirrelConfig? = nil

    /// default config name
    public static let defaultConfigName = ".squirrel.yml"

    private let yaml: Node

    /// Constructs shared config and set `SquirrelConfig.shared` to this instance
    ///
    /// - Parameter path: Path to config file
    /// - Throws: `SquirrelConfigError`, `PathKit` errors and `Yams` errors
    public init(path: Path) throws {
        guard path.exists && path.isFile && path.isReadable else {
            throw SquirrelConfigError(kind: .missingConfigFile(path: path))
        }
        let content: String = try path.read()
        guard let rootNode = try compose(yaml: content) else {
            throw SquirrelConfigError(kind: .noRoot)
        }
        yaml = rootNode
        SquirrelConfig.shared = self
    }

    /// Get root node
    public var rootNode: Node {
        return yaml
    }
}
