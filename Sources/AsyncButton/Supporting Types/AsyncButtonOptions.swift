//
//  AsyncButtonOptions.swift
//
//
//  Created by Edon Valdman on 12/26/23.
//

import Foundation

/// Options for configuring an `AsyncButton`.
public struct AsyncButtonOptions: OptionSet, Sendable {
    public let rawValue: UInt8
    
    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }
    
    /// When used, the button will be disabled while its action is running.
    public static var disableButton: AsyncButtonOptions { AsyncButtonOptions(rawValue: 1 << 0) }
    /// When used, the button's label will be replaced with its placeholder view while its action is running.
    public static var showPlaceholder: AsyncButtonOptions { AsyncButtonOptions(rawValue: 1 << 1) }
    public static var all: AsyncButtonOptions { [.disableButton, .showPlaceholder] }
}
