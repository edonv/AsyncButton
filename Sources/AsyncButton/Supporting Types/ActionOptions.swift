//
//  ActionOptions.swift
//  
//
//  Created by Edon Valdman on 12/26/23.
//

import Foundation

extension AsyncButton {
    public struct ActionOptions: OptionSet {
        public var rawValue: UInt8
        
        public init(rawValue: UInt8) {
            self.rawValue = rawValue
        }
        
        public static var disableButton: ActionOptions { ActionOptions(rawValue: 1 << 0) }
        public static var showProgressView: ActionOptions { ActionOptions(rawValue: 1 << 1) }
        public static var all: ActionOptions { [.disableButton, .showProgressView] }
    }
}