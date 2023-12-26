//
//  AsyncButton.swift
//  
//  Created by John Sundell on 12/2/21.
//  Tweaked by Edon Valdman.
//

import SwiftUI

import SwiftUIBackports

@available(iOS 13.0, macOS 10.15, macCatalyst 13.0, tvOS 13.0, watchOS 6.0, *)
public struct AsyncButton<Label: View, Placeholder: View>: View {
    @Environment(\.isEnabled) var isEnabled
    
    var runAction: Binding<Bool>?
    var actionOptions = ActionOptions.all
    var action: () async -> Void
    @ViewBuilder
    var label: () -> Label
    @ViewBuilder
    var placeholder: () -> Placeholder
    
    public init(
        runAction: Binding<Bool>? = nil,
        actionOptions: ActionOptions = ActionOptions.all,
        action:  @escaping () async -> Void,
        @ViewBuilder label: @escaping () -> Label,
        @ViewBuilder placeholder: @escaping () -> Placeholder
    ) {
        self.runAction = runAction
        self.actionOptions = actionOptions
        self.action = action
        self.label = label
        self.placeholder = placeholder
    }
    
    @State private var isRunningAction = false
    @State private var showProgressView = false
    private var isDisabled: Bool {
        !isEnabled
        || (actionOptions.contains(.disableButton) && isRunningAction)
    }
    
    public var body: some View {
        Button {
            isRunningAction = true
        } label: {
            label()
                .opacity(showProgressView ? 0 : 1)
        }
        .disabled(isDisabled)
        .overlayBackport {
            if showProgressView {
                placeholder()
            }
        }
        .animation(.default.speed(2), value: isEnabled)
        .animation(.default.speed(2), value: showProgressView)
        // Sync changes to `runAction` with `isRunningAction`
        .taskBackport(id: runAction?.wrappedValue) {
            guard let newValue = runAction?.wrappedValue,
                  newValue != isRunningAction else { return }
            
            isRunningAction = newValue
        }
        // On changes to `isRunningAction`, run code.
        .taskBackport(id: isRunningAction) {
            // If the new value of `isRunningAction` doesn't match `runAction`, pass it along.
            if runAction?.wrappedValue != isRunningAction {
                runAction?.wrappedValue = isRunningAction
            }
            
            // Only run the rest of the action (and everything going with it) if `isRunningAction` is `true`
            guard isRunningAction else { return }
            
            // Make sure that everything is turned back off when scope is eventually exited
            // If the task is cancelled early, this closure is still called when exiting scope
            defer {
                showProgressView = false
                isRunningAction = false
                runAction?.wrappedValue = false
            }
            
            // If options are set to show the placeholder view, start showing it if `action()` takes longer than 0.15 seconds
            var progressViewTask: Task<Void, Error>?
            if actionOptions.contains(.showProgressView) {
                progressViewTask = Task {
                    try await Task.sleep(nanoseconds: 150_000_000)
                    showProgressView = true
                }
            }
            
            // Run `action()`
            await action()
            
            // Cancel the progressViewTask if it hasn't been finished yet
            progressViewTask?.cancel()
        }
    }
}

private struct AsyncButton_Preview: View {
    @State private var runAction = false
    
    var body: some View {
        VStack {
            Toggle("Run Action", isOn: $runAction)
            Button("Run") { runAction.toggle() }
            
            AsyncButton(runAction: $runAction, actionOptions: .all) {
                do {
                    try await Task.sleep(nanoseconds: 2 * 1_000_000_000)
                    print("Finished")
                } catch {
                    // this is for testing purposes because cancelling the sleep Task will throw a CancellationError
                    print(error)
                }
            } label: {
                Text("Finished")
            }
        }
        .padding()
    }
}

#Preview {
    AsyncButton_Preview()
}
