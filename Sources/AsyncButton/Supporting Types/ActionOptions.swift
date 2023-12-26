//
//  ActionOptions.swift
//  
//
//  Created by Edon Valdman on 12/26/23.
//

import Foundation

extension AsyncButton {
    /// Options for configuring an `AsyncButton`.
    public struct ActionOptions: OptionSet, Sendable {
        public let rawValue: UInt8
        
        public init(rawValue: UInt8) {
            self.rawValue = rawValue
        }
        
        /// When used, the button will be disabled while its action is running.
        public static var disableButton: ActionOptions { ActionOptions(rawValue: 1 << 0) }
        /// When used, the button's label will be replaced with its placeholder view while its action is running.
        public static var showPlaceholder: ActionOptions { ActionOptions(rawValue: 1 << 1) }
    }
}
