//
//  ViewExtension.swift
//  catOS
//
//  Created by rosadiez on 5/6/24.
//

import Foundation
import SwiftUI

extension View {
    
    func loading(_ value: Binding<Bool>) -> some View {
        self.modifier(LoadingView(loading: value))
    }
    
    func errorAlert(_ error: Binding<CatError?>) -> some View {
        self.modifier(ErrorAlert(error: error))
    }
    
    func foregroundGradient(colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: .init(colors: colors),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
            .mask(self)
    }
}
