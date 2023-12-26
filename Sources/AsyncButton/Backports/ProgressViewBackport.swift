//
//  ProgressViewBackport.swift
//
//
//  Created by Edon Valdman on 12/26/23.
//

import SwiftUI
import SwiftUIBackports

/// An internally-used wrapper view that uses the first-party `ProgressView` when the system running the code supports it (i.e. iOS 14+), falling back on `SwiftUIBackports`' `UIViewRepresentable` backport of `UIActivityIndicatorView`.
///
/// It should not be used outside the package.
@available(iOS 13, macOS 10.15, macCatalyst 13, tvOS 13, watchOS 7.0, *)
public struct ProgressViewBackport: View {
    internal init() {}
    
    public var body: some View {
        if #available(iOS 14.0, macOS 11.0, macCatalyst 14.0, tvOS 14.0, watchOS 7.0, *) {
            ProgressView()
        } else {
            #if !os(watchOS)
            Backport<Any>.ProgressView()
            #endif
        }
    }
}
