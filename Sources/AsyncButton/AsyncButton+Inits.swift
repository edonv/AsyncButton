//
//  AsyncButton+Inits.swift
//  
//
//  Created by Edon Valdman on 6/15/23.
//

import SwiftUI
import SwiftUIBackports

extension AsyncButton {
    /// Creates an asynchronous button that displays a custom label with a default placeholder.
    ///
    /// The default placeholder is a normal progress view. This can be styled using the `.progressViewStyle` view modifier, if on an supporting OS.
    /// - Parameters:
    ///   - runAction: An optional binding to a property that controls the state of the button's asynchronous `action`.
    ///   - actionOptions: Options for configuring the button's view composition.
    ///   - action: The asynchronous action to perform when the user triggers the button.
    ///   - label: A view that describes the purpose of the button's `action`.
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
    
    /// Creates an asynchronous button that displays a label (generated from a string and) a custom placeholder.
    /// - Parameters:
    ///   - title: A string that describes the purpose of the button's `action`.
    ///   - runAction: An optional binding to a property that controls the state of the button's asynchronous `action`.
    ///   - actionOptions: Options for configuring the button's view composition.
    ///   - action: The asynchronous action to perform when the user triggers the button.
    ///   - placeholder: A view that is displayed while `action` runs (optionally can be disabled via `actionOptions`).
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
    
    /// Creates an asynchronous button that displays a label (generated from a localized string key) and a custom placeholder.
    /// - Parameters:
    ///   - titleKey: The key for the button's localized title, that describes the purpose of the button's `action`.
    ///   - runAction: An optional binding to a property that controls the state of the button's asynchronous `action`.
    ///   - actionOptions: Options for configuring the button's view composition.
    ///   - action: The asynchronous action to perform when the user triggers the button.
    ///   - placeholder: A view that is displayed while `action` runs (optionally can be disabled via `actionOptions`).
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
    
    /// Creates an asynchronous button that displays a label (generated from a string and system icon image) and a custom placeholder.
    /// - Parameters:
    ///   - title: A string that describes the purpose of the button's `action`.
    ///   - systemImage: The name of the image resource to lookup.
    ///   - runAction: An optional binding to a property that controls the state of the button's asynchronous `action`.
    ///   - actionOptions: Options for configuring the button's view composition.
    ///   - action: The asynchronous action to perform when the user triggers the button.
    ///   - placeholder: A view that is displayed while `action` runs (optionally can be disabled via `actionOptions`).
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
    
    /// Creates an asynchronous button that displays a label (generated from a localized string key and system icon image) and a custom placeholder.
    /// - Parameters:
    ///   - titleKey: The key for the button's localized title, that describes the purpose of the button's `action`.
    ///   - systemImage: The name of the image resource to lookup.
    ///   - runAction: An optional binding to a property that controls the state of the button's asynchronous `action`.
    ///   - actionOptions: Options for configuring the button's view composition.
    ///   - action: The asynchronous action to perform when the user triggers the button.
    ///   - placeholder: A view that is displayed while `action` runs (optionally can be disabled via `actionOptions`).
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
    
    /// Creates an asynchronous button that displays a label (generated from a string and icon image) and a custom placeholder.
    /// - Parameters:
    ///   - title: A string that describes the purpose of the button's `action`.
    ///   - image: The name of the image resource to lookup.
    ///   - runAction: An optional binding to a property that controls the state of the button's asynchronous `action`.
    ///   - actionOptions: Options for configuring the button's view composition.
    ///   - action: The asynchronous action to perform when the user triggers the button.
    ///   - placeholder: A view that is displayed while `action` runs (optionally can be disabled via `actionOptions`).
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
    
    /// Creates an asynchronous button that displays a label (generated from a localized string key and icon image) and a custom placeholder.
    /// - Parameters:
    ///   - titleKey: The key for the button's localized title, that describes the purpose of the button's `action`.
    ///   - image: The name of the image resource to lookup.
    ///   - runAction: An optional binding to a property that controls the state of the button's asynchronous `action`.
    ///   - actionOptions: Options for configuring the button's view composition.
    ///   - action: The asynchronous action to perform when the user triggers the button.
    ///   - placeholder: A view that is displayed while `action` runs (optionally can be disabled via `actionOptions`).
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
