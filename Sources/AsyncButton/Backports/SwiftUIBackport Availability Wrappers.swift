//
//  SwiftUIBackport Availability Wrappers.swift
//
//
//  Created by Edon Valdman on 12/26/23.
//

import SwiftUI
import SwiftUIBackports

internal extension View {
    @ViewBuilder
    func taskBackport<T: Equatable>(id: T, priority: TaskPriority = .userInitiated, _ action: @MainActor @escaping @Sendable () async -> Void) -> some View {
        if #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) {
            self.task(id: id, priority: priority, action)
        } else {
            self.backport.task(id: id, priority: priority, action)
        }
    }
    
    @ViewBuilder
    func overlayBackport<V>(
        alignment: Alignment = .center,
        @ViewBuilder content: () -> V
    ) -> some View where V: View {
        if #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) {
            self.overlay(alignment: alignment, content: content)
        } else {
            self.backport.overlay(alignment: alignment, content)
        }
    }
}
