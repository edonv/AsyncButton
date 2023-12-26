//
//  AsyncButton+Inits.swift
//  
//
//  Created by Edon Valdman on 6/15/23.
//

import SwiftUI
import SwiftUIBackports

extension AsyncButton {
    @available(iOS 13.0, macOS 10.15, macCatalyst 13.0, tvOS 13.0, watchOS 7.0, *)
    public init(
        runAction: Binding<Bool>? = nil,
        actionOptions: ActionOptions = .all,
        action: @escaping () async -> Void,
        @ViewBuilder label: @escaping () -> Label
    ) where Placeholder == ProgressViewBackport {
        self.init(runAction: runAction, actionOptions: actionOptions, action: action, label: label) {
            ProgressViewBackport()
        }
    }
    
    @available(iOS 13.0, macOS 10.15, macCatalyst 13.0, tvOS 13.0, watchOS 6.0, *)
    public init<S: StringProtocol>(
        _ title: S,
        runAction: Binding<Bool>? = nil,
        actionOptions: ActionOptions = ActionOptions.all,
        action: @escaping () async -> Void,
        @ViewBuilder placeholderView: @escaping () -> Placeholder
    ) where Label == Text {
        self.init(runAction: runAction, action: action, label: {
            Text(title)
        }, placeholderView: placeholderView)
    }
    
    @available(iOS 13.0, macOS 10.15, macCatalyst 13.0, tvOS 13.0, watchOS 6.0, *)
    public init(
        _ titleKey: LocalizedStringKey,
        runAction: Binding<Bool>? = nil,
        actionOptions: ActionOptions = ActionOptions.all,
        action: @escaping () async -> Void,
        @ViewBuilder placeholderView: @escaping () -> Placeholder
    ) where Label == Text {
        self.init(runAction: runAction, action: action, label: {
            Text(titleKey)
        }, placeholderView: placeholderView)
    }
    
    @available(iOS 13.0, macOS 11.0, macCatalyst 13.0, tvOS 13.0, watchOS 6.0, *)
    public init(
        runAction: Binding<Bool>? = nil,
        systemImageName: String,
        actionOptions: ActionOptions = ActionOptions.all,
        action: @escaping () async -> Void,
        @ViewBuilder placeholderView: @escaping () -> Placeholder
    ) where Label == Image {
        self.init(runAction: runAction, actionOptions: actionOptions, action: action, label: {
            Image(systemName: systemImageName)
        }, placeholderView: placeholderView)
    }
    
    @available(iOS 13.0, macOS 10.15, macCatalyst 13.0, tvOS 13.0, watchOS 6.0, *)
    public init(
        runAction: Binding<Bool>? = nil,
        imageName: String,
        actionOptions: ActionOptions = ActionOptions.all,
        action: @escaping () async -> Void,
        @ViewBuilder placeholderView: @escaping () -> Placeholder
    ) where Label == Image {
        self.init(runAction: runAction, actionOptions: actionOptions, action: action, label: {
            Image(imageName)
        }, placeholderView: placeholderView)
    }
}
