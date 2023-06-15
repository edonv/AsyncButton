//
//  AsyncButton.swift
//  
//
//  Created by Edon Valdman on 6/15/23.
//

import SwiftUI

public struct AsyncButton<Label: View, Trigger: Equatable>: View {
    private let action: () async -> Void
    private let label: Label
    
    @State private var isRunning = false
    @State private var task: Task<Void, Never>?
    
    public init(
        action: @escaping () async -> Void,
        @ViewBuilder label: () -> Label
    ) {
        self.action = action
        self.label = label()
    }
    
    public var body: some View {
        Button {
            task = Task {
                isRunning = true
                await action()
                isRunning = false
            }
        } label: {
            label
        }
    }
}
