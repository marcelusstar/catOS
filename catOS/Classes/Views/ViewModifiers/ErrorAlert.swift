//
//  ErrorAlert.swift
//  catOS
//
//  Created by rosadiez on 5/6/24.
//

import Foundation
import SwiftUI

struct ErrorAlert: ViewModifier {
    
    @Binding var error: CatError?
    var isShowingError: Binding<Bool> {
        Binding {
            error != nil
        } set: { _ in
            error = nil
        }
    }
    
    func body(content: Content) -> some View {
        content
            .alert(isPresented: isShowingError, error: error) { _ in
            } message: { error in
                if let message = error.failureReason {
                    Text(message)
                }
            }
    }
}
