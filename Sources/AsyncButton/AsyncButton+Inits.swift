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
        @ViewBuilder placeholder: @escaping () -> Placeholder
    ) where Label == Text {
        self.init(runAction: runAction, action: action, label: {
            Text(title)
        }, placeholder: placeholder)
    }
    
    @available(iOS 13.0, macOS 10.15, macCatalyst 13.0, tvOS 13.0, watchOS 6.0, *)
    public init(
        _ titleKey: LocalizedStringKey,
        runAction: Binding<Bool>? = nil,
        actionOptions: ActionOptions = ActionOptions.all,
        action: @escaping () async -> Void,
        @ViewBuilder placeholder: @escaping () -> Placeholder
    ) where Label == Text {
        self.init(runAction: runAction, action: action, label: {
            Text(titleKey)
        }, placeholder: placeholder)
    }
    
    @available(iOS 14.0, macOS 11.0, macCatalyst 14.0, tvOS 14.0, watchOS 7.0, *)
    public init<S: StringProtocol>(
        _ title: S,
        systemImage: String,
        runAction: Binding<Bool>? = nil,
        actionOptions: ActionOptions = ActionOptions.all,
        action: @escaping () async -> Void,
        @ViewBuilder placeholder: @escaping () -> Placeholder
    ) where Label == SwiftUI.Label<Text, Image> {
        self.init(runAction: runAction, actionOptions: actionOptions, action: action, label: {
            Label(title, systemImage: systemImage)
        }, placeholder: placeholder)
    }
    
    @available(iOS 14.0, macOS 11.0, macCatalyst 14.0, tvOS 14.0, watchOS 7.0, *)
    public init(
        _ titleKey: LocalizedStringKey,
        systemImage: String,
        runAction: Binding<Bool>? = nil,
        actionOptions: ActionOptions = ActionOptions.all,
        action: @escaping () async -> Void,
        @ViewBuilder placeholder: @escaping () -> Placeholder
    ) where Label == SwiftUI.Label<Text, Image> {
        self.init(runAction: runAction, actionOptions: actionOptions, action: action, label: {
            Label(titleKey, systemImage: systemImage)
        }, placeholder: placeholder)
    }
    
    @available(iOS 14.0, macOS 11.0, macCatalyst 14.0, tvOS 14.0, watchOS 7.0, *)
    public init<S: StringProtocol>(
        _ title: S,
        image: String,
        runAction: Binding<Bool>? = nil,
        actionOptions: ActionOptions = ActionOptions.all,
        action: @escaping () async -> Void,
        @ViewBuilder placeholder: @escaping () -> Placeholder
    ) where Label == SwiftUI.Label<Text, Image> {
        self.init(runAction: runAction, actionOptions: actionOptions, action: action, label: {
            Label(title, image: image)
        }, placeholder: placeholder)
    }
    
    @available(iOS 14.0, macOS 11.0, macCatalyst 14.0, tvOS 14.0, watchOS 7.0, *)
    public init(
        _ titleKey: LocalizedStringKey,
        image: String,
        runAction: Binding<Bool>? = nil,
        actionOptions: ActionOptions = ActionOptions.all,
        action: @escaping () async -> Void,
        @ViewBuilder placeholder: @escaping () -> Placeholder
    ) where Label == SwiftUI.Label<Text, Image> {
        self.init(runAction: runAction, actionOptions: actionOptions, action: action, label: {
            Label(titleKey, image: image)
        }, placeholder: placeholder)
    }
}
